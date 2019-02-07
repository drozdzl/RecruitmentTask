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

class NetworkingManager: NSObject {
    
    static var sharedManager = NetworkingManager()
    private override init() {}
    weak var delegate: NetworkingManagerDelegate?
    
    typealias ItemsJsonCompletion = (() -> ([Item]))
    typealias JSON = [String: Any]
    
    
    func downloadItems() {
        request(filename: "Items.json") { dictionary in
            let data = dictionary["data"]
             let array = data as! Array<Dictionary<String, AnyObject>>
            let completion = self.decodableObject([Item].self, fromJson: array)
            
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
            let dataDict = data as! Dictionary<String, AnyObject>
          
            let completion = self.decodableObject(ItemDetails.self, fromJson: dataDict)
            print(completion)
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
