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
    // the main context, should only be used to edit menus, only saved when
    // - a mneu is created, a menu's name is changed, an item is edited
    static let mainContext = ContextManager.shared.persistentContainer.viewContext
    
    // a context used to manage orders, only saved when a new order is added (when the user taps on add new order or add new booking)
    static var orderContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
    static func setUpContexts() {
        orderContext.parent = mainContext
    }
    
    static func createNewShift() -> Shift {
        let shift = Shift(context: mainContext)
        shift.date = Date()
        saveMainContext()
        return shift
    }
    
    static func saveOrderContext() {
        // saving to persistent store!
        do {
            try orderContext.save()
            mainContext.performAndWait {
                do {
                    try mainContext.save()
                } catch let me {
                    print(me)
                }
            }
        } catch let e {
            print(e)
        }
    }

    static func saveMainContext() {
        do {
            try mainContext.save()
        } catch let error {
            fatalError("Error saving context: \(error)")
        }
    }
    
    
}
