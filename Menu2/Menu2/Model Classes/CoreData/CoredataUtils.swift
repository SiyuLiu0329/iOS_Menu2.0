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
    static let context = ContextManager.shared.persistentContainer.viewContext
    static var childContext: NSManagedObjectContext?
    
    static func createNewShift() -> Shift {
        let shift = Shift(context: context)
        shift.date = Date()
        saveContext()
        return shift
    }

    static func saveContext() {
        do {
            try context.save()
        } catch let error {
            fatalError("Error saving context: \(error)")
        }
    }
}
