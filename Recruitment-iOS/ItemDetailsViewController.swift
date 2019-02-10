import UIKit

protocol ItemDetailsDisplayLogic: class {
    func displayItemDetails(_ item: ItemDetails)
    func displayError(_ error: String)
    func displayChangedBackgroundColor(_ color: UIColor)
}

class ItemDetailsViewController: UIViewController, ItemDetailsDisplayLogic {

    // MARK: Outlets
    @IBOutlet weak var textView: UITextView!
    
    // MARK: Properties
    var interactor: (ItemDetailsBusinessLogic & ItemDataStore)?
    var router: ItemDetailsRouter?

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
        interactor?.fetchItemDetails()
    }

    // MARK: View customization

    fileprivate func setupView() {
        interactor?.changeBackgroundColor()
        title = interactor?.item?.name.changedTitle
    }

    // MARK: Event handling

    // MARK: Presenter methods
    
    func displayError(_ error: String) {
        
    }
    
    func displayItemDetails(_ item: ItemDetails) {
        textView.text = item.description
        
    }
    
    func displayChangedBackgroundColor(_ color: UIColor) {
        self.view.backgroundColor = color
    }
}
