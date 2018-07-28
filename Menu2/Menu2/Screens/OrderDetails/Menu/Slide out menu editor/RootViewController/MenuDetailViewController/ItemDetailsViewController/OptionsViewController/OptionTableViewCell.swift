//
//  OptionTableViewCell.swift
//  Menu2
//
//  Created by Siyu Liu on 27/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit
class OptionTableViewCell: UITableViewCell {
    static let cellId = "cellId"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        textLabel?.font = UIFont(name: "Myriad Web Pro", size: 19)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var viewModel: OptionTableViewCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            contentView.backgroundColor = viewModel.backgroundColor
            textLabel?.text = viewModel.name
            // make a price label
        }
    }
}
