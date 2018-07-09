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
            let w = GenericItemView.requiredHeightAndWidth / 2
            itemView.frame = CGRect(x: contentView.center.x - w, y: 50, width: GenericItemView.requiredHeightAndWidth, height: GenericItemView.requiredHeightAndWidth)
            itemView.viewModel = viewModel
        }
    }
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Preview"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(itemView)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var itemView: GenericItemView = {
        let itemView = GenericItemView()
        itemView.translatesAutoresizingMaskIntoConstraints = false
        return itemView
    }()
    
    private func setUpViews() {
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant:16),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 16),
            titleLabel.heightAnchor.constraint(equalToConstant: 24)])
        
        contentView.addSubview(itemView)
    }
}
