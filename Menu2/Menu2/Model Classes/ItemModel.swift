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
    }
    
    func deleteItem(at index: Int) {
        let item = items.remove(at: index)
        CoredataUtils.delete(item: item)
    }
    
    func getViewModel(forItemAt index: Int) -> GenericItemTableViewCellViewModel {
        let item = items[index]
        let viewModel = GenericItemTableViewCellViewModel(image: UIImage(named: "food_placeholder")!, title: item.name ?? "Unamed Item", subTitle: "$10.95", acessoryType: .disclosureIndicator)
        return viewModel
    }
}

