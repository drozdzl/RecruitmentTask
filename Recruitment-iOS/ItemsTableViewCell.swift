//
//  ItemsTableViewCell.swift
//  Recruitment-iOS
//
//  Created by Łukasz Drożdż on 08/02/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import UIKit

protocol RercuitmentCell {
    static var cellId: String { get }
}

class ItemsTableViewCell: UITableViewCell, RercuitmentCell {
    
    //MARK: Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var previewLabel: UILabel!
    
    //MARK: Properties
    
    static var cellId: String {
        return "ItemsTableViewCell"
    }
    
    var item: Item? {
        didSet {
            nameLabel.text = item?.name
            previewLabel.text = item?.preview
            backgroundColor = item?.colorsEnum.color
        }
    }
}
