import UIKit

protocol ItemTableViewPresentationLogic {
    func presentError(_ error: Error)
    func presentItems(_ items: [Item])
}

class ItemTableViewPresenter: ItemTableViewPresentationLogic {
	weak var viewController: ItemTableViewDisplayLogic?

	// MARK: Presentation logic
    
    func presentError(_ error: Error) {
        viewController?.displayError(error.localizedDescription)
    }
    
    func presentItems(_ items: [Item]) {
        viewController?.displayItems(items)
    }
	
}
