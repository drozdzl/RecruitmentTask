import UIKit

protocol StartBusinessLogic {
}

class StartInteractor: StartBusinessLogic {
	var presenter: StartPresentationLogic?
	var worker = StartWorker()

	// MARK: Business logic
	
}
