import UIKit

protocol ItemsCollectionBusinessLogic {
    func fetchItems()
}

class ItemsCollectionInteractor: ItemsCollectionBusinessLogic {
	var presenter: ItemsCollectionPresentationLogic?
	var worker = ItemsCollectionWorker()
    var itemTableViewWorker = ItemTableViewWorker()

	// MARK: Business logic
    
    func fetchItems() {
        itemTableViewWorker.fetchItemsFromLocalStorage { [weak self] (items, error) in
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
