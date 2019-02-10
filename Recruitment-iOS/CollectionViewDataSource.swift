//
//  CollectionViewDataSource.swift
//  Recruitment-iOS
//
//  Created by Łukasz Drożdż on 10/02/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import UIKit

class CollectionViewDataSource:  UICollectionViewFlowLayout, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: Properties
    var items: [Item] = []
    
    // MARK: Collection View data source methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.cellId, for: indexPath) as! ItemCollectionViewCell
        cell.item = item
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewSize = collectionView.frame.size.width - 32
        
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsMake(10, 10, 10, 10)
    }

    
}
