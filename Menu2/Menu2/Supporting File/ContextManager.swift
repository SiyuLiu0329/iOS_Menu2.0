//
//  ContextManager.swift
//  Menu2
//
//  Created by Siyu Liu on 16/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import Foundation
import CoreData


struct ContextManager {
    static let shared = ContextManager()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Menu")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Error loading store: \(error )")
            }
        }
        return container
    } ()
}
