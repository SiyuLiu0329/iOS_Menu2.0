//
//  MenuModel.swift
//  Menu2
//
//  Created by Siyu Liu on 27/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit
import CoreData

class MenuModel {
    var menus = [Menu]()
    var selectedMenu = 0
    var numberOfMenus: Int {
        return menus.count
    }
    
    func deleteMenu(at index: Int) {
        let menu = menus.remove(at: index)
        CoredataUtils.delete(menu: menu) // remember to update UI
    }
    
    init() {
        loadMenus()
    }
    
    func createNewMenu(with name: String) -> Menu {
        let menu =  CoredataUtils.insertMenu(name: name)
        menus.append(menu)
        return menu
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
    
    func getViewModelForMenu(at index: Int) -> SlideOutMenuTableViewCellViewModel {
        let menu = menus[index]
        return SlideOutMenuTableViewCellViewModel.init(title: menu.name ?? "Unnamed Menu", icon: UIImage(named:
            "menu_icon")!)
    }
}

extension MenuModel {
    // these functions are used for debug only
    func testGetNumberOfItemsInMenus() -> Int {
        let request: NSFetchRequest = Item.fetchRequest()
        do {
            return try CoredataUtils.mainContext.fetch(request).count
        } catch let error {
            print(error)
        }
        return 0
    }
}


