import UIKit

class ItemDetailsWorker {
    
    func fetchItemDetail(forId id: String, completion: @escaping ItemDetailCompletion<ItemDetails>) {
        NetworkingManager.sharedManager.downloadItemDetail(type: ItemDetails.self, forId: id) { (item, error) in
            completion(item, error)
        }
    }
}
