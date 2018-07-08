//
//  File.swift
//  Menu2
//
//  Created by Siyu Liu on 8/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import Foundation

class ItemEditorModel {
    var item: Item
    var selectedField: Int?
    
    init(item: Item) {
        self.item = item
        let priceText = (item.price == nil) ? nil : "$\(item.price!)"
        textFieldViewModels = [
            GenericTextFieldCellViewModel(title: "Item Name", value: item.name),
            GenericTextFieldCellViewModel(title: "Item Price", value: priceText),
            GenericTextFieldCellViewModel(title: "Description", value: item.itemDescription)
        ]
    }
    
    var textFieldViewModels: [GenericTextFieldCellViewModel]
}
