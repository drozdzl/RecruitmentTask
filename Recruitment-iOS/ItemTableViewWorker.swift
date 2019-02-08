import UIKit

class ItemTableViewWorker {
    
    func fetchItemsFromLocalStorage(completion: @escaping ItemsJsonCompletion<Item>) {
        NetworkingManager.sharedManager.downloadItems(type: Item.self, forFileName: "Items") { (items, error) in
            completion(items,error)
        }
    }
}
