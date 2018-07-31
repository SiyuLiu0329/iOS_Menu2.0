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
    static let mainContext = ContextManager.shared.persistentContainer.viewContext
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
