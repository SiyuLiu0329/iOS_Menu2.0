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
            return try context.fetch(fetchReqest)
        } catch {
            print("Error fetching menus.")
        }
        return nil
    }
    
    static func insertOrder(into shift: Shift, number: Int, paid: Bool, served: Bool, refunded: Bool, isBooking: Bool, bookingArrived: Bool, save: Bool) -> Order {
        let order = Order(context: context)
        order.paid = paid
        order.number = Int32(number)
        order.served = served
        order.bookingArrived = bookingArrived
        order.isBooking = isBooking
        order.refunded = refunded
        order.timeCreated = Date()
        order.shift = shift
        if save {
            saveContext()
        }
        return order
    }
    
    static func add(item: Item, to order: Order) {
        item.order = order
        saveContext()
    }
    
    static func delete(order: Order) {
        context.delete(order)
    }
    

}
