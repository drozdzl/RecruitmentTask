//
//  NetworkingExtension.swift
//  Recruitment-iOS
//
//  Created by Łukasz Drożdż on 07/02/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import Foundation

extension NetworkingManager {
    
    func decodableObject<T: Decodable>(_ object: T.Type, fromJson jsonArray: [Dictionary<String, AnyObject>]) -> (T?, Error?) {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: jsonArray, options: .prettyPrinted)
         return decode(toObject: object, from: jsonData)
        } catch {
            return (nil, error)
        }
    }
    
    func decodableObject<T: Decodable>(_ object: T.Type, fromJson json: [String: Any]) -> (T?, Error?) {
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
