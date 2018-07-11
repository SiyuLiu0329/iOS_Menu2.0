//
//  File.swift
//  Menu2
//
//  Created by Siyu Liu on 8/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class ItemEditorModel {
    var item: Item

    init(item: Item) {
        self.item = item
        let priceText = (item.price == nil) ? "0" : "\(item.price!)"
        let name = item.name ?? "Unamed Item"
        textFieldViewModels = [
            GenericTextFieldCellViewModel(title: "Item Name", value: name),
            GenericTextFieldCellViewModel(title: "Item Price", value: priceText)
        ]
        
        itemPreviewModel = GenericItemViewModel(item: item)
    }
    
    var itemPreviewModel: GenericItemViewModel
    var textFieldViewModels: [GenericTextFieldCellViewModel]
    
    var imagesForItem = [
        UIImage(named: "food"),
        UIImage(named: "coffee"),
        UIImage(named: "cup")
    ]
    
    func selectImage(at index: Int) {
        itemPreviewModel.image = imagesForItem[index] // change the image in view model then reload UI
    }
    
    func updateTextField(indexed index: Int, with newVale: String) {
        textFieldViewModels[index].value = newVale
        if index == 0 {
            itemPreviewModel.name = newVale
        }
    }
    
    func commitChanges() {
        item.name = itemPreviewModel.name
        // item.price
        
    }
}
