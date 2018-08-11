//
//  SlideOutMenuTableViewCell.swift
//  Menu2
//
//  Created by Siyu Liu on 4/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class SlideOutMenuTableViewCell: UITableViewCell {
    static let cellId = "slideOutCell"
    
    var viewModel: SlideOutMenuTableViewCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            imageView?.image = viewModel.icon
            textLabel?.text = viewModel.title
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        textLabel?.font = UIFont.myriad(size: 19)
        accessoryType = .disclosureIndicator
        imageView?.tintColor = UIColor.themeColour
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
