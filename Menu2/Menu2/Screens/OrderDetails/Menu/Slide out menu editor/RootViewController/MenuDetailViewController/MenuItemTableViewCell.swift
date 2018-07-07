//
//  MenuDetailsTableViewCell.swift
//  Menu2
//
//  Created by Siyu Liu on 7/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class MenuItemTableViewCell: UITableViewCell {
    static let preferredCellHeight: CGFloat = 120
    static let cellId = "menuDetailsCell"
    var edgeSpacing: CGFloat = 12
    var itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        contentView.addSubview(itemImageView)
        NSLayoutConstraint.activate([
            itemImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: edgeSpacing),
            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: edgeSpacing),
            itemImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -edgeSpacing),
            itemImageView.widthAnchor.constraint(equalToConstant: MenuItemTableViewCell.preferredCellHeight -  edgeSpacing * 2)])
    }
}
