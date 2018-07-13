//
//  GenericTextFieldCellViewModel.swift
//  Menu2
//
//  Created by Siyu Liu on 8/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

struct GenericTextFieldCellViewModel {
    var title: String
    var value: String?
    var keyboardType: UIKeyboardType
    var isEditable: Bool {
        return value != nil
    }
}
