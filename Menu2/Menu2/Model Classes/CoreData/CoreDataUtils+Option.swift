//
//  CoreDataUtils+Option.swift
//  Menu2
//
//  Created by Siyu Liu on 26/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import Foundation
import CoreData

extension CoredataUtils {
    static func fetchOptions() -> [Option]? {
        let fetchReqest: NSFetchRequest = Option.fetchRequest()
        do {
            return try CoredataUtils.context.fetch(fetchReqest)
        } catch {
            print("Error fetching options.")
        }
        return nil
    }
    
    static func insertOption(named name: String, price: Float) -> Option {
        let option = Option(context: context)
        option.name = name
        option.price = price
        option.selected = false
        saveContext()
        return option
    }
    
    static func delete(option: Option) {
        context.delete(option)
        saveContext()
    }
}
