import UIKit

protocol StartDisplayLogic: class {
}

class StartViewController: UIViewController, StartDisplayLogic {

    // MARK: Outlets

    // MARK: Properties
    var interactor: StartBusinessLogic?
    var router: StartRouter?

    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: View customization

    fileprivate func setupView() {
    }

    // MARK: Event handling
    @IBAction func startAction(_ sender: Any) {
        router?.navigateToApp()
    }
    
    // MARK: Presenter methods
}
