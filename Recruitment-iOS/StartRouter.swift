import UIKit

class StartRouter {
    weak var viewController: StartViewController?

    // MARK: Routing

    func passDataToNextScene(segue: UIStoryboardSegue, sender: Any?) {

    }

    // MARK: Navigation
    
    func navigateToApp() {
        guard let tabBarVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateInitialViewController() else {
            return
        }
        changeRootViewController(with: tabBarVC)
    }

    // MARK: Passing data
    
    private func changeRootViewController(with vc: UIViewController) {
        if let window: UIWindow = (UIApplication.shared.delegate as? AppDelegate)?.window {
            UIView.transition(with: window,
                              duration: 0.6,
                              options: .transitionCrossDissolve,
                              animations: {
                                
                                window.rootViewController = vc
                                
            }, completion: nil)
        }
    }
}
