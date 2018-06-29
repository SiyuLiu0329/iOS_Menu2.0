//
//  MenuCollectionViewCell.swift
//  Menu2
//
//  Created by Siyu Liu on 29/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    static let cellId = "menuCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpCell() {
        layer.addBorder(edge: .right, color: .lightGray, thickness: 0.5, inset: 30)
        
    }
}
