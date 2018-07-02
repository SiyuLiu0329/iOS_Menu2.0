//
//  MenuItemCollectionView.swift
//  Menu2
//
//  Created by Siyu Liu on 29/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class MenuItemCollectionView: UICollectionView {
    let preferredNumberOfItemsPerRow = 5
    let preferredInterItemSpacing: CGFloat = 10
    let preferredInset: CGFloat = 20
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        backgroundColor = UIColor.collectionViewBackgroundColour
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
