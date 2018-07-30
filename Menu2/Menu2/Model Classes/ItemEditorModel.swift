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
    var isItemNew: Bool
    private var menu: Menu
    //  maybe use a child context
    private func unpackItem(item: Item) {
        
    }

    init(item: Item, menu: Menu) {
        self.item = item
        isItemNew = false
        let priceText = (item.price == nil) ? "0" : "\(item.price!)"
        let name = item.name ?? "Unamed Item"
        textFieldViewModels = [
            GenericTextFieldCellViewModel(title: "Item Name", value: name, keyboardType: .default),
            GenericTextFieldCellViewModel(title: "Item Price", value: priceText, keyboardType: .decimalPad),
            GenericTextFieldCellViewModel(title: "Identifier", value: item.identifier, keyboardType: .default)
        ]
        self.menu = menu
        itemPreviewModel = GenericItemViewModel(item: item)
    }
    
    init(menu: Menu) {
        self.menu = menu
        self.item = Item(context: CoredataUtils.mainContext)
        let priceText = (item.price == nil) ? "0" : "\(item.price!)"
        let name = item.name ?? "Unamed Item"
        isItemNew = true
        textFieldViewModels = [
            GenericTextFieldCellViewModel(title: "Item Name", value: name, keyboardType: .default),
            GenericTextFieldCellViewModel(title: "Item Price", value: priceText, keyboardType: .decimalPad),
            GenericTextFieldCellViewModel(title: "Identifier", value: item.identifier, keyboardType: .default)
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
    
    func select(image: UIImage) {
        itemPreviewModel.image = image
    }
    
    func updateTextField(indexed index: Int, with newVale: String) {
        textFieldViewModels[index].value = newVale
        if index == 0 {
            itemPreviewModel.name = newVale
            return
        }
        
        if index == 2 {
            itemPreviewModel.id = newVale
        }
        
    }
    
    func commitChanges() -> Item {
        item.name = itemPreviewModel.name
        if textFieldViewModels[1].value == "" {
            item.price = 0
        } else {
            item.price = NSDecimalNumber(string: textFieldViewModels[1].value)
        }
        
        item.identifier = textFieldViewModels[2].value
        // save image data here
        if let data = itemPreviewModel.image?.jpegData(compressionQuality: 1) {
            item.imgData = data
        }
        
        if isItemNew {
            item.menu = menu
        }
        CoredataUtils.saveMainContext()
        // sort and calulcate reload index
        return item
    }
}
