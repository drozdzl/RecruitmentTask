import UIKit

protocol ItemDetailsPresentationLogic {
    func presentItemDetails(_ item: ItemDetails)
    func presentError(_ error: RMError)
    func presentchangedBackgroundColor(_ color: UIColor)
}

class ItemDetailsPresenter: ItemDetailsPresentationLogic {
	weak var viewController: ItemDetailsDisplayLogic?

	// MARK: Presentation logic
    
    func presentItemDetails(_ item: ItemDetails) {
        viewController?.displayItemDetails(item)
    }
    
    func presentError(_ error: RMError) {
        viewController?.displayError(error.localizedDescription)
    }
    
    func presentchangedBackgroundColor(_ color: UIColor) {
        viewController?.displayChangedBackgroundColor(color)
    }
	
}
