//
//  ItemsTableViewCell.swift
//  Recruitment-iOS
//
//  Created by Łukasz Drożdż on 08/02/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import UIKit

protocol RecruitmentCell {
    static var cellId: String { get }
}

class ItemsTableViewCell: UITableViewCell, RecruitmentCell {
    
    //MARK: Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var previewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
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
