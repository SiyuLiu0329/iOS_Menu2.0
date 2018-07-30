//
//  MenuInfoEditorModel.swift
//  Menu2
//
//  Created by Siyu Liu on 24/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import Foundation

class MenuInfoEditorModel {
    var menu: Menu
    var menuEditorTextfieldViewModels: [GenericTextFieldCellViewModel]
    
    init(menu: Menu) {
        self.menu = menu
        menuEditorTextfieldViewModels = [
            GenericTextFieldCellViewModel(title: "Menu Name", value: menu.name ?? "Unamed Menu", keyboardType: .default),
        ]
    }
    
    func updateText(index: Int, newValue: String) {
        menuEditorTextfieldViewModels[index].value = newValue
    }
    
    func saveMenuInfo() {
        let name = menuEditorTextfieldViewModels[0].value ?? "Unamed Menu"
        menu.name = name.isEmpty ? "Unnamed Menu" : name
        CoredataUtils.saveMainContext()
    }
}
