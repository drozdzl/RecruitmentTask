//
//  NetworkingManager.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

protocol NetworkingManagerDelegate: class {
    func downloadedItems(_ items:[ItemModel])
    func downloadedItemDetails(_ itemDetails:ItemDetailsModel)
}

typealias ItemsJsonCompletion<T> = ([T]?, Error?) -> Void
typealias ItemDetailCompletion<T> = (T?, Error?) -> Void

class NetworkingManager: NSObject {
    
    static var sharedManager = NetworkingManager()
    private override init() {}
    weak var delegate: NetworkingManagerDelegate?

    func downloadItems<T: Decodable>(type: T.Type, forFileName name: String, completion: @escaping ItemsJsonCompletion<T>){
        request(filename: "\(name).json") { (dictionary) in
            let data = dictionary["data"]
            let array = data as! Array<Dictionary<String, AnyObject>>
            let result = self.decodableObject([T].self, fromJson: array)
            completion(result.items, result.error)
        }
    }
    
    func downloadItemDetail<T: Decodable>(forId id: String, completion: @escaping ItemDetailCompletion<T>) {
        let filename = "Item\(id).json"
        request(filename: filename) { (dictionary) in
            let data = dictionary["data"] as! Dictionary<String, AnyObject>
            let result = self.decodableObject(T.self, fromJson: data)
            completion(result.itemDetail, result.error)
        }
    }
    
    func downloadItems() {
        request(filename: "Items.json") { dictionary in
            let data = dictionary["data"]
             let array = data as! Array<Dictionary<String, AnyObject>>
           
            
            var result:[ItemModel] = []
            for item in array {
                let name = item["attributes"]?["name"] as? String
                let colorString = item["attributes"]?["color"] as? String
                var color:UIColor?
                switch colorString! {
                case "Red": color = UIColor.red
                case "Green": color = UIColor.green
                case "Blue": color = UIColor.blue
                case "Yellow": color = UIColor.yellow
                case "Purple": color = UIColor.purple
                default: color = UIColor.black
                }
                let itemModel = ItemModel(name: name!, color: color!)
                result.append(itemModel)
            }
            self.delegate?.downloadedItems(result)
        }
    }
    
    func downloadItemWithID(_ id:String) {
        let filename = "Item\(id).json"
        request(filename: filename) { dictionary in
            let data = dictionary["data"]
            let attributes = data!["attributes"]! as! Dictionary<String, AnyObject>
          
          
            let name = attributes["name"] as? String
            let colorString = attributes["color"] as? String
            var color:UIColor?
            switch colorString! {
            case "Red": color = UIColor.red
            case "Green": color = UIColor.green
            case "Blue": color = UIColor.blue
            case "Yellow": color = UIColor.yellow
            case "Purple": color = UIColor.purple
            default: color = UIColor.black
            }
            let desc = attributes["desc"] as? String
            let itemModelDetails = ItemDetailsModel(name: name!, color: color!, desc: desc!)
            self.delegate?.downloadedItemDetails(itemModelDetails)
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
    
    fileprivate func decodableObject<T: Decodable>(_ object: T.Type, fromJson jsonArray: [Dictionary<String, AnyObject>]) -> (items: T?, error: Error?) {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: jsonArray, options: .prettyPrinted)
            return decode(toObject: object, from: jsonData)
        } catch {
            return (nil, error)
        }
    }
    
    fileprivate func decodableObject<T: Decodable>(_ object: T.Type, fromJson json: [String: Any]) -> (itemDetail: T?, error: Error?) {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            return decode(toObject: object, from: jsonData)
        } catch {
            return (nil, error)
        }
    }
    
    private func decode<T: Decodable>(toObject object: T.Type, from data: Data) ->  (T?, Error?) {
        do {
            let value = try JSONDecoder().decode(T.self, from: data)
            print(value)
            return (value, nil)
        } catch {
            return (nil, error)
        }
    }
    
}
