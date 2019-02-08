import UIKit

protocol ItemTableViewBusinessLogic {
    func fetchItems()
}

class ItemTableViewInteractor: ItemTableViewBusinessLogic {
	var presenter: ItemTableViewPresentationLogic?
	var worker = ItemTableViewWorker()
    
    // MARK: Business logic
    func fetchItems() {
        worker.fetchItemsFromLocalStorage { [weak self] (items, error) in
            if let error = error {
                self?.presenter?.presentError(error)
                return
            }
            
            if let items = items {
                self?.presenter?.presentItems(items)
            }
        }
    }
}
