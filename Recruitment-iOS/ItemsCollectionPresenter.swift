import UIKit

protocol ItemsCollectionPresentationLogic {
    func presentItems(_ items: [Item])
    func presentError(_ error: RMError)
}

class ItemsCollectionPresenter: ItemsCollectionPresentationLogic {
	weak var viewController: ItemsCollectionDisplayLogic?

	// MARK: Presentation logic
    
    func presentItems(_ items: [Item]) {
       viewController?.displayItems(items)
    }
    
    func presentError(_ error: RMError) {
         viewController?.displayError(error.localizedDescription)
    }
	
}
