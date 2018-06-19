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
        deleteAllMenus()
    }
    
    func fetchAllMenus() -> [Menu]? {
        let fetchReqest: NSFetchRequest = Menu.fetchRequest()
        do {
            return try context.fetch(fetchReqest)
        } catch {
            print("Error fetching menus.")
        }
        return nil
    }
    
    private func saveContext() {
        do {
            try context.save()
        } catch let error {
            fatalError("Error saving context: \(error)")
        }
    }
    
    func addMenu(name: String, decription: String?) {
        let menu = Menu(context: context)
        menu.name = name
        menu.menuDescription = decription
        saveContext()
    }
    
    // Create a new Menu object and save onto the persistent store using a background thread.
    func backgroundAddMenu(name: String, description: String?, completion: (() -> Void)?) {
        DispatchQueue.global(qos: .background).async {
            let privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
            privateContext.parent = self.context
            let menu = Menu(context: privateContext)
            menu.name = name
            menu.menuDescription = description
            do {
                // push changes to the main context
                try privateContext.save()
            } catch let error {
                fatalError("Error saving context: \(error)")
            }
            
            DispatchQueue.main.async {
                do {
                    // if there isn't any uncommited changes, return
                    if !self.context.hasChanges {
                        return
                    }
                    // push changes from the main context to the persistent store
                    try self.context.save()
                    self.printMenus()
                } catch let error {
                    fatalError("Error saving main context: \(error)")
                }
                
                guard let completion = completion else { return }
                // execute main thread tasks (eg update UI)
                completion()
            }
        }
        
    }
    
    func deleteAllMenus() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Menu")
        let deleteRequest = NSBatchDeleteRequest( fetchRequest: fetchRequest)
        do {
            try context.execute(deleteRequest)
        } catch let error {
            fatalError("Error deleting: \(error)")
        }
    }
}

extension CoredataUtils {
    func printMenus() {
        if let menus = fetchAllMenus() {
            menus.forEach({print($0.name, $0.menuDescription)})
        }
    }
}
