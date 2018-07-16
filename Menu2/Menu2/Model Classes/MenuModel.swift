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
    var selectedMenu = 0
    var numberOfMenus: Int {
        return menus.count
    }
    
    func deleteMenu(at index: Int) {
        print("Number of items before deletion:", testGetNumberOfItemsInMenus())
        let menu = menus.remove(at: index)
        CoredataUtils.delete(menu: menu) // remember to update UI
        print("Number of items after deletion:", testGetNumberOfItemsInMenus())
    }
    
    init() {
        loadMenus()
    }
    
    func loadMenus() {
        if let loadedMenus = CoredataUtils.loadAllMenus() {
            menus = loadedMenus
        }
    }
    
    func getMenuTitles() -> [String] {
        var titles = [String]()
        menus.forEach({titles.append($0.name ?? "Unamed")})
        return titles
    }
}

extension MenuModel {
    // these functions are used for debug only
    func testGetNumberOfItemsInMenus() -> Int {
        let request: NSFetchRequest = Item.fetchRequest()
        do {
            return try CoredataUtils.context.fetch(request).count
        } catch let error {
            print(error)
        }
        return 0
    }
}


