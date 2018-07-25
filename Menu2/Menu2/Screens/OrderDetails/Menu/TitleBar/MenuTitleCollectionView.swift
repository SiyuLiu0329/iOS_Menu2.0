//
//  MenuTitleCollectionView.swift
//  Menu2
//
//  Created by Siyu Liu on 2/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

/*
 A page menu at the bottom of the screen, holds all menu names and contains mechanism for switching
 */
class MenuTitleCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        if let layout = layout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        backgroundColor = UIColor.themeColour
        alwaysBounceHorizontal = true
        showsHorizontalScrollIndicator = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var preferredHeight: CGFloat = 30
}
