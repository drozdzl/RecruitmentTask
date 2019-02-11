import UIKit
import SVProgressHUD_0_8_1

protocol ItemsCollectionDisplayLogic: class {
    func displayItems(_ items: [Item])
    func displayError(_ error: String)
}

class ItemsCollectionViewController: UIViewController, ItemsCollectionDisplayLogic {

    // MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet var collectionViewDataStore: CollectionViewDataSource!
    // MARK: Properties
    var interactor: ItemsCollectionBusinessLogic?
    var router: ItemsCollectionRouter?

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
        registerNibs()
        setupView()
        interactor?.fetchItems()
    }

    // MARK: View customization

    fileprivate func setupView() {
        activityIndicator.startAnimating()
    }

    // MARK: Event handling

    // MARK: Presenter methods
    
    func displayError(_ error: String) {
        activityIndicator.stopAnimating()
        SVProgressHUD.showError(withStatus: error)
    }
    
    func displayItems(_ items: [Item]) {
        collectionViewDataStore.items = items
        activityIndicator.stopAnimating()
        collectionView.reloadData()
    }
}

extension ItemsCollectionViewController {
    fileprivate func registerNibs() {
        let cell = UINib.init(nibName: ItemCollectionViewCell.cellId, bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: ItemCollectionViewCell.cellId)
    }
}
