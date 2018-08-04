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
        saveMainContext()
    }
    
    static func copy(item: Item, to context: NSManagedObjectContext) -> Item {
        let newItem = Item(context: context)
        newItem.name = item.name
        newItem.imgData = item.imgData
        newItem.identifier = item.identifier
        newItem.price = item.price
        newItem.transferrable = item.transferrable
        
        item.options?.forEach({ (option) in
            let option = option as! Option
            let newOption = Option(context: context)
            newOption.name = option.name
            newOption.price = option.price
            newItem.addToOptions(newOption)
        })
        return newItem
    }
    
    static func removeItemFromOrder(item: Item) {
        orderContext.delete(item)
        saveOrderContext()
    }
    
}
