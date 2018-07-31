//
//  CoreDataUtils+Item.swift
//  Menu2
//
//  Created by Siyu Liu on 29/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import Foundation
import CoreData

extension CoredataUtils {
    static func delete(item: Item) {
        mainContext.delete(item)
//        saveContext()
    }
    
    static func copy(item: Item, to context: NSManagedObjectContext) -> Item {
        let newItem = Item(context: context)
        newItem.name = item.name
        newItem.imgData = item.imgData
        newItem.identifier = item.identifier
        newItem.price = item.price
        newItem.transferrable = item.transferrable
        
        return newItem
    }
    
}
