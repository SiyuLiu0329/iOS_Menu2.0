//
//  MenuModel.swift
//  Menu2
//
//  Created by Siyu Liu on 16/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import Foundation
import CoreData

class CoredataUtils {
    let context = ContextManager.shared.persistentContainer.viewContext
    
    init() {
        addMenu(name: "\(self)", decription: nil)
        if let menus = fetchMenus() {
            menus.forEach({print($0.name, $0.menuDescription)})
        }
    }
    
    func addMenu(name: String, decription: String?) {
        let menu = Menu(context: context)
        menu.name = name
        menu.menuDescription = decription
        saveContext()
    }
    
    func fetchMenus() -> [Menu]? {
        let fetchReqest: NSFetchRequest = Menu.fetchRequest()
        do {
            return try context.fetch(fetchReqest)
        } catch {
            print("Error fetching menus.")
        }
        return nil
    }
    
    func saveContext() {
        do {
            try context.save()
        } catch let error {
            fatalError("Error saving context: \(error)")
        }
    }
}
