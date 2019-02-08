import UIKit

protocol ItemDetailsBusinessLogic {
    func fetchItemDetails()
}

protocol ItemDataStore {
    var id: String? { get }
}

class ItemDetailsInteractor: ItemDetailsBusinessLogic, ItemDataStore {
	var presenter: ItemDetailsPresentationLogic?
	var worker = ItemDetailsWorker()

    var id: String?
    
	// MARK: Business logic
    
    func fetchItemDetails() {
        guard let id = id else { return }
        worker.fetchItemDetail(forId: id) { [weak self] (itemDetail, error) in
            if let error = error {
                self?.presenter?.presentError(error)
                return
            }
            
            if let details = itemDetail {
                self?.presenter?.presentItemDetails(details)
            }
        }
    }
	
}
