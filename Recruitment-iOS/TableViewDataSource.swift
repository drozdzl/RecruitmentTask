//
//  TableViewDataSource.swift
//  Recruitment-iOS
//
//  Created by Łukasz Drożdż on 08/02/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource {
    
    // MARK: Properties
    
    var items: [Item]
    
    init(items: [Item]) {
        self.items = items
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
    
    
}
