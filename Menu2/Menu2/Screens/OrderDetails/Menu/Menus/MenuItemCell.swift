//
//  MenuItemCell.swift
//  Menu2
//
//  Created by Siyu Liu on 29/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

/*
 Cell which holds a menu item
 */
class MenuItemCell: UICollectionViewCell {
    static let cellId = "itemCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        layer.cornerRadius = 5
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.themeColour.withAlphaComponent(0.4).cgColor
        
        addDropShadow(offset: CGSize(width: 1.0, height: 1.0), radius: 1, opacity: 0.6)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
