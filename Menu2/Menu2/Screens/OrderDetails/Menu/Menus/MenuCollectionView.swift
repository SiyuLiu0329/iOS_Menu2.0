//
//  OrderSectionCollectionView.swift
//  Menu2
//
//  Created by Siyu Liu on 27/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

/*
 A horizontal scrolling collection view holding all menus
 */
class MenuCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        backgroundColor = UIColor.collectionViewBackgroundColour
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


