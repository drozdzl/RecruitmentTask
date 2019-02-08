import UIKit

protocol ItemDetailsPresentationLogic {
    func presentItemDetails(_ item: ItemDetails)
    func presentError(_ error: Error)
}

class ItemDetailsPresenter: ItemDetailsPresentationLogic {
	weak var viewController: ItemDetailsDisplayLogic?

	// MARK: Presentation logic
    
    func presentItemDetails(_ item: ItemDetails) {
        viewController?.displayItemDetails(item)
    }
    
    func presentError(_ error: Error) {
        viewController?.displayError(error.localizedDescription)
    }
	
}
