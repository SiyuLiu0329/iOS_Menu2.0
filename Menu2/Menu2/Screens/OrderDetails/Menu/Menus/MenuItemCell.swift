//
//  MenuItemCell.swift
//  Menu2
//
//  Created by Siyu Liu on 29/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class MenuItemCell: UICollectionViewCell {
    static let cellId = "itemCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.themeColour.withAlphaComponent(0.1)
        
        layer.cornerRadius = 5
        layer.borderWidth = 1.0
        
        layer.borderColor = UIColor.clear.cgColor
        layer.masksToBounds = true
        
//        layer.shadowColor = UIColor.gray.cgColor
//        layer.shadowOffset = CGSize(width: 0, height: 2.0)
//        layer.shadowRadius = 2.0
//        layer.shadowOpacity = 1.0
//        layer.masksToBounds = false
//        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
