//
//  OptionTableViewCellViewModel.swift
//  Menu2
//
//  Created by Siyu Liu on 27/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

struct OptionTableViewCellViewModel {
    var name: String
    var price: Float
    var isInMenu: Bool
    var backgroundColor: UIColor {
        return isInMenu ? UIColor.themeColour.withAlphaComponent(0.5) : UIColor.white
    }
}
