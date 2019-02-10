//
//  ItemCollectionViewCell.swift
//  Recruitment-iOS
//
//  Created by Łukasz Drożdż on 10/02/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell, RecruitmentCell {
    
    // MARK: Outlets
    @IBOutlet weak var nameLabel: UILabel!
   
    // MARK: Properties
    
    static var cellId: String {
        return "ItemCollectionViewCell"
    }
    
    var item: Item? {
        didSet {
            nameLabel.text = item?.name
           
            backgroundColor = item?.colorsEnum.color
        }
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsDisplay()
        layoutIfNeeded()
        
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        layoutAttributes.frame = frame
        
        return layoutAttributes
    }

}
