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
    static let cellHeight = GenericItemViewWithInfo.preferredHeight
    static let cellWidth = GenericItemViewWithInfo.preferredWidth
    var item: Item? {
        didSet {
            itemView.frame = contentView.frame
            guard let item = item else { return }
            itemView.viewModel = GenericItemViewModel(item: item)
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        contentView.addSubview(itemView)
    }
    
    var itemView = GenericItemViewWithInfo()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
