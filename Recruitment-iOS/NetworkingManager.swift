//
//  NetworkingManager.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

typealias ItemsJsonCompletion<T> = ([T]?, RMError?) -> Void
typealias ItemDetailCompletion<T> = (T?, RMError?) -> Void

class NetworkingManager: NSObject {
    
    static var sharedManager = NetworkingManager()
    private override init() {}

    func downloadItems<T: Decodable>(type: T.Type, forFileName name: String, completion: @escaping ItemsJsonCompletion<T>){
        request(filename: "\(name).json") { (dictionary) in
            let data = dictionary["data"]
            guard let array = data as?  Array<Dictionary<String, AnyObject>> else {
                completion(nil, RMError.castingError)
                return
            }
            let result = self.decodableObject([T].self, fromJson: array)
            completion(result.items, result.error)
        }
    }
    
    func downloadItemDetail<T: Decodable>(type: T.Type, forId id: String, completion: @escaping ItemDetailCompletion<T>) {
        let filename = "Item\(id).json"
        request(filename: filename) { (dictionary) in
            guard let data = dictionary["data"] as? Dictionary<String, AnyObject> else {
                completion(nil, RMError.castingError)
                return
            }
            let result = self.decodableObject(T.self, fromJson: data)
            completion(result.itemDetail, result.error)
        }
    }
    
    private func request(filename:String, completionBlock:@escaping (Dictionary<String, AnyObject>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if let dictionary = JSONParser.jsonFromFilename(filename) {
                completionBlock(dictionary)
            } else {
                completionBlock([:])
            }
        }
    }
}

extension NetworkingManager {
    
    fileprivate func decodableObject<T: Decodable>(_ object: T.Type, fromJson jsonArray: [Dictionary<String, AnyObject>]) -> (items: T?, error: RMError?) {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: jsonArray, options: .prettyPrinted)
            return decode(toObject: object, from: jsonData)
        } catch {
            return (nil, RMError.jsonSerializationError)
        }
    }
    
    fileprivate func decodableObject<T: Decodable>(_ object: T.Type, fromJson json: [String: Any]) -> (itemDetail: T?, error: RMError?) {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            return decode(toObject: object, from: jsonData)
        } catch  {
            return (nil, RMError.jsonSerializationError)
        }
    }
    
    private func decode<T: Decodable>(toObject object: T.Type, from data: Data) ->  (T?, RMError?) {
        do {
            let value = try JSONDecoder().decode(T.self, from: data)
            print(value)
            return (value, nil)
        } catch {
            return (nil, RMError.jsonSerializationError)
        }
    }
    
}
