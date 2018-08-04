//
//  MenuItemTableViewCell.swift
//  Menu2
//
//  Created by Siyu Liu on 1/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class OrderItemTableViewCell: UITableViewCell {
    
    private let itemNameHeight: CGFloat = 44
    private let leftRightMargin: CGFloat = 8
    
    var viewModel: OrderItemTableViewCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            layoutViews()
            itemName.text = viewModel.name
        }
    }
    
    private func layoutViews() {
        // refresh the layout
        itemName.frame = CGRect(x: leftRightMargin, y: 0, width: contentView.frame.width - 2 * leftRightMargin, height: itemNameHeight)
        
    }
    
    var itemName: UILabel = {
        let label = UILabel()
        label.font = UIFont.myriad(size: 19)
        return label
    }()
    
    private func setUpViews() {
        contentView.addSubview(itemName)
    }
    
    static let cellId = "orderItemCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
