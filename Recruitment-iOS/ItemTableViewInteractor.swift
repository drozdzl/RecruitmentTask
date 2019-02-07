import UIKit

protocol ItemTableViewBusinessLogic {
}

class ItemTableViewInteractor: ItemTableViewBusinessLogic {
	var presenter: ItemTableViewPresentationLogic?
	var worker = ItemTableViewWorker()

	// MARK: Business logic
	
}
