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
    
    init(item: Item) {
        self.item = item
        let priceText = (item.price == nil) ? "0" : "\(item.price!)"
        let name = item.name ?? "Unamed Item"
        textFieldViewModels = [
            GenericTextFieldCellViewModel(title: "Item Name", value: name),
            GenericTextFieldCellViewModel(title: "Item Price", value: priceText),
            GenericTextFieldCellViewModel(title: "Description", value: item.itemDescription)
        ]
        
        itemPreviewModel = GenericItemViewModel(name: name, price: priceText)
    }
    
    // view models are stored so undo change can be achieved
    // changed properties are stored seprately
    let itemPreviewModel: GenericItemViewModel
    let textFieldViewModels: [GenericTextFieldCellViewModel]
}
