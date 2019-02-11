//
//  TableViewDataSource.swift
//  Recruitment-iOS
//
//  Created by Łukasz Drożdż on 08/02/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import UIKit

protocol ItemListDelegate: class {
    func didSelectItem(_ item: Item)
}

class TableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Properties
    
    var items: [Item] = []
    
    weak var delegate: ItemListDelegate?
    
    override init() {
        super.init()
    }
    
    // MARK: TableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemsTableViewCell.cellId, for: indexPath) as? ItemsTableViewCell else { return UITableViewCell() }
        
        let item = items[indexPath.row]
        cell.item = item
        
        return cell
    }
    
    // MARK: TableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectItem(items[indexPath.row])
    }
}
