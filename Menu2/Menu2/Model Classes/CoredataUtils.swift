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
    
    static func fetchOrders() -> [Order]? {
        let fetchReqest: NSFetchRequest = Order.fetchRequest()
        do {
            return try context.fetch(fetchReqest)
        } catch {
            print("Error fetching menus.")
        }
        return nil
    }
    
    static func insertOrder(into shift: Shift, number: Int, paid: Bool, served: Bool, refunded: Bool, isBooking: Bool, bookingArrived: Bool) {
        let order = Order(context: context)
        order.paid = paid
        order.number = Int32(number)
        order.served = served
        order.bookingArrived = bookingArrived
        order.isBooking = isBooking
        order.refunded = refunded
        order.timeCreated = Date()
        order.shift = shift
        saveContext()
    }
    
    static func fetchShifts() -> [Shift]? {
        let fetchReqest: NSFetchRequest = Shift.fetchRequest()
        do {
            return try context.fetch(fetchReqest)
        } catch {
            print("Error fetching menus.")
        }
        return nil
    }
    
    static func createNewShift() -> Shift {
        let shift = Shift(context: context)
        shift.date = Date()
        saveContext()
        return shift
    }

    static private func saveContext() {
        do {
            try context.save()
        } catch let error {
            fatalError("Error saving context: \(error)")
        }
    }

}
