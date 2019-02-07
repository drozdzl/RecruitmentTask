import UIKit

protocol ItemsCollectionBusinessLogic {
}

class ItemsCollectionInteractor: ItemsCollectionBusinessLogic {
	var presenter: ItemsCollectionPresentationLogic?
	var worker = ItemsCollectionWorker()

	// MARK: Business logic
	
}
