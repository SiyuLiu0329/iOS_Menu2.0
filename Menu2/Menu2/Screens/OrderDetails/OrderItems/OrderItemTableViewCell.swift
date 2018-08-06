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
    private let priceLabelWidth: CGFloat = 90
    private let quantityLabelWidth: CGFloat = 26
    
    var viewModel: OrderItemTableViewCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            itemName.text = viewModel.name
            priceLabel.text = viewModel.price
            quantityLabel.text = viewModel.quantity
        }
    }
    var quantityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 19, weight: .medium)
        return label
    }()
    
    var itemName: UILabel = {
        let label = UILabel()
//        label.backgroundColor = .red
        label.font = UIFont.myriad(size: 19)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
//        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
//        label.backgroundColor = .blue
        label.textAlignment = .right
        label.numberOfLines = 1
        label.font = UIFont.myriad(size: 19)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private func setUpViews() {
        contentView.addSubview(quantityLabel)
        contentView.addSubview(itemName)
        contentView.addSubview(priceLabel)
        layoutViews()
    }
    
    private func layoutViews() {
        NSLayoutConstraint.activate([
            quantityLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: topBottomMargin),
            quantityLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: leftRightMargin),
            quantityLabel.bottomAnchor.constraint(equalTo: itemName.bottomAnchor),
            quantityLabel.widthAnchor.constraint(equalToConstant: quantityLabelWidth),
            
            itemName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: topBottomMargin),
            itemName.leftAnchor.constraint(equalTo: quantityLabel.rightAnchor, constant: leftRightMargin),
            itemName.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -(priceLabelWidth)),
            
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
