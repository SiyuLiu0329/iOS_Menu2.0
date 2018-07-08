//
//  GenericTextFieldCellViewModel.swift
//  Menu2
//
//  Created by Siyu Liu on 8/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

struct GenericTextFieldCellViewModel {
    let title: String
    let value: String?
    var isEditable: Bool {
        return value != nil
    }
}
