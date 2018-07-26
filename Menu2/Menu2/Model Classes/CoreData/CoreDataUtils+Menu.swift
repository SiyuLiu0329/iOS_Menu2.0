//
//  CoreDataUtils+Menu.swift
//  Menu2
//
//  Created by Siyu Liu on 29/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import Foundation
import CoreData

extension CoredataUtils {
    static func loadAllMenus() -> [Menu]? {
        let fetchRequest: NSFetchRequest = Menu.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch let error {
            print("Error fetching:", error)
        }
        return nil
    }
    
    static func delete(menu: Menu) {
        context.delete(menu)
        saveContext()
    }
    
    static func insertMenu(name: String) -> Menu {
        let menu = Menu(context: context)
        menu.name = name
        saveContext()
        return menu
    }
    
    static func add(item: Item, to menu: Menu) {
        menu.addToItems(item)
        saveContext()
    }
}
