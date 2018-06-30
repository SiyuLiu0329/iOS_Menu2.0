//
//  MenuModel.swift
//  Menu2
//
//  Created by Siyu Liu on 27/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import Foundation
import CoreData

class MenuModel {
    private let context = CoredataUtils.context
    var menus = [Menu]()
    var numberOfMenus: Int {
        return menus.count
    }
    
    init() {
        if let loadedMenus = CoredataUtils.loadAllMenus() {
            menus = loadedMenus
            print(menus)
        }
        
        if menus.count == 0 {
            insertTestMenus()
        }
        
        addTestItemsToMenus()
        
    }
    
    func getMenuTitles() -> [String] {
        var titles = [String]()
        menus.forEach({titles.append($0.name ?? "Unamed")})
        return titles
    }
    
    
}

extension MenuModel {
    private func insertTestMenus() {
        (1...10).forEach({_ = CoredataUtils.insertMenu(name: "Menu\($0)")})
    }
    
    private func addTestItemsToMenus() {
        menus.forEach { (menu) in
            if let items = menu.items {
                if items.count != 0 {
                    print(items.count)
                    return
                }
            }
            
            let nItems = Int.random(in: (5...30))
            var n = 1
            for _ in 5...nItems {
                let item = Item(context: CoredataUtils.context)
                item.name = "Item \(n)"
                CoredataUtils.add(item: item, to: menu)
                n += 1
            }
        }
    }
    
}
