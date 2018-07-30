//
//  CoreDataUtils+Order.swift
//  Menu2
//
//  Created by Siyu Liu on 29/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import Foundation
import CoreData

extension CoredataUtils {
    static func fetchOrders() -> [Order]? {
        let fetchReqest: NSFetchRequest = Order.fetchRequest()
        do {
            return try mainContext.fetch(fetchReqest)
        } catch {
            print("Error fetching menus.")
        }
        return nil
    }
    
    
    static func insertOrder(into shift: Shift, number: Int, paid: Bool, served: Bool, refunded: Bool, isBooking: Bool, bookingArrived: Bool, save: Bool) -> Order {

        let order = Order(context: mainContext)
        order.paid = paid
        order.number = Int32(number)
        order.served = served
        order.bookingArrived = bookingArrived
        order.isBooking = isBooking
        order.refunded = refunded
        order.timeCreated = Date()
        order.shift = shift
        return order
    }
    
    static func insert(item: Item, into order: Order) {
        // TODO: add item to order, they are NOT in the same context!
        order.addToItems(item)
        saveMainContext()
    }
    
    static func delete(order: Order) {
        mainContext.delete(order)
    }
    

}
