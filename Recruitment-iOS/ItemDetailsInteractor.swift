import UIKit

protocol ItemDetailsBusinessLogic {
}

class ItemDetailsInteractor: ItemDetailsBusinessLogic {
	var presenter: ItemDetailsPresentationLogic?
	var worker = ItemDetailsWorker()

	// MARK: Business logic
	
}
