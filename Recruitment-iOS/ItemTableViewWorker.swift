import UIKit

class ItemTableViewWorker {
    
    typealias ItemsCompletion = (()-> [Item])
    
    func fetchItemsFromLocalStorage(completion: @escaping ItemsCompletion) {
        NetworkingManager.sharedManager.downloadItems()
    }
}
