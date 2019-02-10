import UIKit

class ItemTableViewRouter {
    
    weak var viewController: ItemTableViewViewController?

    // MARK: Routing

    func passDataToNextScene(segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue", let item = sender as? Item {
            passDataToNextStep(vc: segue.destination, item: item)
        }
    }

    // MARK: Navigation
    
    func navigateToItemDetails(withItem item: Item) {
        viewController?.performSegue(withIdentifier: "DetailSegue", sender: item)
    }

    // MARK: Passing data
    
    fileprivate func passDataToNextStep(vc: UIViewController, item: Item) {
        let vc = vc as? ItemDetailsViewController
        vc?.interactor?.item = item
    }

}
