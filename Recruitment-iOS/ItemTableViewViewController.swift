import UIKit

protocol ItemTableViewDisplayLogic: class {
    func displayItems(_ items: [Item])
    func displayError(_ error: String)
}

class ItemTableViewViewController: UIViewController, ItemTableViewDisplayLogic {

    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var tableViewDataSource: TableViewDataSource!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    // MARK: Properties
    
    var interactor: ItemTableViewBusinessLogic?
    var router: ItemTableViewRouter?

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
        registerCells()
        setupView()
        tableViewDataSource.delegate = self
        interactor?.fetchItems()
    }

    // MARK: View customization

    fileprivate func setupView() {
        activityIndicator.startAnimating()
    }

    // MARK: Event handling

    // MARK: Presenter methods
    
    func displayItems(_ items: [Item]) {
        tableViewDataSource.items = items
        activityIndicator.stopAnimating()
        tableView.reloadData()
    }
    
    func displayError(_ error: String) {
        activityIndicator.stopAnimating()
    }
}

extension ItemTableViewViewController {
    fileprivate func registerCells() {
        let itemNIb = UINib(nibName: ItemsTableViewCell.cellId, bundle: nil)
        tableView.register(itemNIb, forCellReuseIdentifier: ItemsTableViewCell.cellId)
    }
}

extension ItemTableViewViewController: ItemListDelegate {
    func didSelectItem(_ item: Item) {
        router?.navigateToItemDetails(withItem: item)
    }
}
