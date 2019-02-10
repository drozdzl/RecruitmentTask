import UIKit

protocol ItemDetailsBusinessLogic {
    func fetchItemDetails()
    func changeBackgroundColor()
}

protocol ItemDataStore {
    var item: Item? { get set }
}

class ItemDetailsInteractor: ItemDetailsBusinessLogic, ItemDataStore {
	var presenter: ItemDetailsPresentationLogic?
	var worker = ItemDetailsWorker()

    var item: Item?
    
	// MARK: Business logic
    
    func changeBackgroundColor() {
        guard let color = item?.colorsEnum.color else { return }
        presenter?.presentchangedBackgroundColor(color)
    }
    
    func fetchItemDetails() {
        guard let id = item?.id else { return }
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
