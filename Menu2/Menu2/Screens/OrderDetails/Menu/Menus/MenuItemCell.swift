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
    static let cellHeight = GenericItemView.preferredHeight
    static let cellWidth = GenericItemView.preferredWidth
    var viewModel: GenericItemViewModel? {
        didSet {
            itemView.frame = contentView.frame
            guard let viewModel = viewModel else { return }
            itemView.viewModel = viewModel
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        contentView.addSubview(itemView)
        addDropShadow(offset: CGSize(width: 1, height: 1), radius: 2, opacity: 0.6)
    }
    
    var itemView = GenericItemView()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
