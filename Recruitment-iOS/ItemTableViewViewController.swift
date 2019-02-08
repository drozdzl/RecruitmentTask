import UIKit

protocol ItemTableViewDisplayLogic: class {
    func displayItems(_ items: [Item])
    func displayError(_ error: String)
}

class ItemTableViewViewController: UIViewController, ItemTableViewDisplayLogic {

    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var tableViewDataSource: TableViewDataSource!
    
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
    }

    // MARK: View customization

    fileprivate func setupView() {
        
    }

    // MARK: Event handling

    // MARK: Presenter methods
    
    func displayItems(_ items: [Item]) {
        tableViewDataSource = TableViewDataSource(items: items)
        tableView.reloadData()
    }
    
    func displayError(_ error: String) {
        
    }
}

extension ItemTableViewViewController {
    fileprivate func registerCells() {
        tableView.register(ItemsTableViewCell.self, forCellReuseIdentifier: ItemsTableViewCell.cellId)
    }
}
