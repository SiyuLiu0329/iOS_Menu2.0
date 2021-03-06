//
//  MenuEditorModel.swift
//  Menu2
//
//  Created by Siyu Liu on 6/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class ItemModel {
    var menu: Menu
    var items: [Item]
    init(menu: Menu) {
        self.menu = menu
        self.items = menu.items?.allObjects as? [Item] ?? []
        self.items.sort(by: {$0.name! < $1.name!})
    }
    
    
    func deleteItem(at index: Int) {
        let item = items.remove(at: index)
        CoredataUtils.delete(item: item)
    }
    
    func getTableViewCellViewModel(forItemAt index: Int) -> GenericItemTableViewCellViewModel {
        let item = items[index]
        return GenericItemTableViewCellViewModel(item: item)
    }
    
    func getItemViewModel(forItemAt index: Int) -> GenericItemViewModel {
        let item = items[index]
        let viewModel = GenericItemViewModel(item: item)
        return viewModel
    }
    
    func updateItems(changedItem: Item) {
        if !items.contains(changedItem) {
            // if item is already in the array -> item was updated
            items.insert(changedItem, at: 0)
        }
        // item was created
        self.items.sort(by: {$0.name! < $1.name!})
    }
}

