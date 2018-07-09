//
//  ItemPreviewTableViewCell.swift
//  Menu2
//
//  Created by Siyu Liu on 9/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class ItemPreviewTableViewCell: UITableViewCell {
    
    var viewModel: GenericItemViewModel? {
        // use an item view model
        didSet {
            guard let viewModel = viewModel else { return }
            let w = GenericItemView.requiredHeightAndWidth
            let x = contentView.center.x - w / 2
            let y = contentView.center.y - w / 2
            itemView.frame = CGRect(x: x, y: y + 20, width: w, height: w)
            itemView.addDropShadow(offset: CGSize(width: 1, height: 1), radius: 2, opacity: 0.6)
            print(viewModel.name, viewModel.price)
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(itemView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var itemView: GenericItemView = {
        let itemView = GenericItemView()
        itemView.translatesAutoresizingMaskIntoConstraints = false
        return itemView
    }()
}
