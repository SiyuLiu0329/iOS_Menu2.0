//
//  MenuItemTableViewCell.swift
//  Menu2
//
//  Created by Siyu Liu on 1/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class OrderItemTableViewCell: UITableViewCell {
    // TODO: quantity label
    // TODO: options
    // TODO: subtotal

    private let itemNameHeight: CGFloat = 44
    private let leftRightMargin: CGFloat = 8
    private let topBottomMargin: CGFloat = 8
    private let priceLabelWidth: CGFloat = 100
    
    var viewModel: OrderItemTableViewCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            itemName.text = viewModel.name
            priceLabel.text = viewModel.price
        }
    }
    
    
    var itemName: UILabel = {
        let label = UILabel()
//        label.backgroundColor = .red
        label.font = UIFont.myriad(size: 19)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
//        label.backgroundColor = .blue
        label.textAlignment = .right
        label.numberOfLines = 1
        label.font = UIFont.myriad(size: 19)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setUpViews() {
        contentView.addSubview(itemName)
        contentView.addSubview(priceLabel)
        layoutViews()
    }
    
    private func layoutViews() {
        NSLayoutConstraint.activate([
            itemName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: topBottomMargin),
            itemName.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: leftRightMargin),
            itemName.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -priceLabelWidth),
            
            priceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -leftRightMargin),
            priceLabel.leftAnchor.constraint(equalTo: itemName.rightAnchor, constant: leftRightMargin),
            priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: topBottomMargin),
            priceLabel.heightAnchor.constraint(equalToConstant: 28)])
        
        
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
