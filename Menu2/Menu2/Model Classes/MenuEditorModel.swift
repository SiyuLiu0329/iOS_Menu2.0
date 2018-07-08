//
//  MenuEditorModel.swift
//  Menu2
//
//  Created by Siyu Liu on 6/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import Foundation
import CoreData

class MenuEditorModel {
    var menu: Menu
    var items: [Item]
    init(menu: Menu) {
        self.menu = menu
        self.items = menu.items?.allObjects as? [Item] ?? []
    }
    
    func deleteItem(at index: Int) {
        let item = items.remove(at: index)
        CoredataUtils.delete(item: item)
    }
}
