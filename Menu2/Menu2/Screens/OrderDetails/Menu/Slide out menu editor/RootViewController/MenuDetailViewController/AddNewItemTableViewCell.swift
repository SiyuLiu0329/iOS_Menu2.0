//
//  AddNewItemTableViewCell.swift
//  Menu2
//
//  Created by Siyu Liu on 17/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class AddNewItemTableViewCell: UITableViewCell {
    static let preferredCellHeight: CGFloat = 44
    static let cellId = "AddItemCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        textLabel?.text = "New Item"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
