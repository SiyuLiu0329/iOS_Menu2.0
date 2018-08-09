//
//  OrderModel.swift
//  Menu2
//
//  Created by Siyu Liu on 22/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import Foundation

typealias OrderSection = (sectionName: String, orders: [Order])

enum SectionName: String {
    case all = "All"
    case inProgress = "In Progress"
    case completed = "Completed"
    case bookings = "Bookings - Not Arrived"
    
    
    case paidAndServed = "pns"
    case servedButRefunded = "sbr"
}

class OrderModel {
    var longPressedOrder: (sectionName: String, index: Int)?
    var shift: Shift?
    var sections: [OrderSection] = [
        (sectionName: SectionName.inProgress.rawValue, orders: []),
        (sectionName: SectionName.bookings.rawValue, orders: []),
        (sectionName: SectionName.completed.rawValue, orders: []),
        (sectionName: SectionName.all.rawValue, orders: []),
    ]
    
    // look up an order based on section name and index in that section
    // used to find the order selected ...
    func getOrder(in sectionName: String, at index: Int) -> Order? {
        var order: Order? = nil
        sections.forEach { (section) in
            if section.sectionName == sectionName {
                order = section.orders[index]
            }
        }
        return order
    }
    
    // called when create new order button is hit, object is not saved to context by default
    func createNewOrder() -> Order? {
        if let shift = shift {
            //TODO: create order in a child context!!
            let order = CoredataUtils.insertOrder(into: shift, number: numberOfOrders + 1, paid: false, served: false, refunded: false, isBooking: false, bookingArrived: false, save: false)
            return order
        }
        
        return nil
    }
    
    func createNewBooking() -> Order? {
        if let shift = shift {
            //TODO: create order in a child context!!
            let order = CoredataUtils.insertOrder(into: shift, number: numberOfOrders + 1, paid: false, served: false, refunded: false, isBooking: true, bookingArrived: false, save: false)
            return order
        }
        
        return nil
    }
    
    func deleteOrder(order: Order) {
        CoredataUtils.delete(order: order)
    }
    
    var numberOfOrders: Int {
        var n = 0
        sections.forEach { (section) in
            if section.sectionName == SectionName.all.rawValue {
                n = section.orders.count
            }
        }
        return n
    }
    
    // number of horizontal sections, not to be confused with collection view sections
    var numberOfSections: Int {
        return sections.count
    }
    
    init() {
        createShiftIfEmpty() // if a shift has not been passed in, create a new one / load the latest one
        loadOrders()
    }
    
    private func createShiftIfEmpty() {
        guard let shifts = CoredataUtils.fetchShifts() else { return }
        if shifts.isEmpty {
            shift = CoredataUtils.createNewShift()
        } else {
            shift = shifts.first
        }
    }
    
    func insertNewOrderIntoDataSource(order: Order) {
        // categorise order based on their attributes (ie paid, served ...)
        let sectionIndex = determineSubsectionIndexFor(order: order)
        sections[sectionIndex].orders.insert(order, at: 0)
        
        sections[3].orders.insert(order, at: 0) // All
    }
    
    /*
     Load and categorise orders
     */
    private func loadOrders() {
        guard let shift = shift else { return }
        if let orders = shift.orders {
            let orders = orders.sorted { (obj1, obj2) -> Bool in
                // sort orders by number, the UI will show them in this order
                let order1 = obj1 as! Order
                let order2 = obj2 as! Order
                return order1.number > order2.number
            }
            
            orders.forEach { (obj) in
                let order = obj as! Order
                
                // categorise order based on their attributes (ie paid, served ...)
                let sectionIndex = determineSubsectionIndexFor(order: order)
                sections[sectionIndex].orders.append(order)
                
                sections[3].orders.append(order) // All
            }
        }
    }
    
    private func determineSubsectionIndexFor(order: Order) -> Int {
        if order.paid && order.served {
            return 2 // completed
        }
            
        if order.isBooking && !order.bookingArrived {
            return 1
        } else {
            return 0
        }
        
    }
}

