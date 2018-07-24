//
//  CreateNewMenuTableViewCell.swift
//  Menu2
//
//  Created by Siyu Liu on 19/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class CreateNewMenuTableViewCell: UITableViewCell {
    static let cellId = "createNewMenu"
    static let height: CGFloat = 44
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        textLabel?.text = "✚ Add Menu"
        textLabel?.textColor = UIColor.themeColour
        textLabel?.textAlignment = .center
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
