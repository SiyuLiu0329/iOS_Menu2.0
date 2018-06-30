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
            let order = CoredataUtils.insertOrder(into: shift, number: numberOfOrders + 1, paid: false, served: false, refunded: false, isBooking: false, bookingArrived: false, save: false)
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
    
    var numberOfSections: Int {
        return sections.count
        
    }
    
    init() {
        createShiftIfEmpty()
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
    
    private func loadOrders() {
        guard let shift = shift else { return }
//        CoredataUtils.insertOrder(into: shift, number: 8, paid: true, served: false, refunded: false, isBooking: false, bookingArrived: false)
        if let orders = shift.orders {
            let orders = orders.sorted { (obj1, obj2) -> Bool in
                let order1 = obj1 as! Order
                let order2 = obj2 as! Order
                return order1.number > order2.number
            }
            
            orders.forEach { (obj) in
                let order = obj as! Order
                testInsertItems(into: order) //TODO: remove this
                if order.paid && order.served {
                    sections[2].orders.append(order) // completed
                } else {
                    
                    if order.isBooking && !order.bookingArrived {
                        sections[1].orders.append(order)
                    } else {
                        sections[0].orders.append(order) // not completed
                    }
                }
                
                sections[3].orders.append(order) // All
                
            }
        }
    }
    
}

extension OrderModel {
    private func testInsertItems(into order: Order) {
        if order.items?.count != 0 {
            return
        }
        let n = Int.random(in: (5...20))
        for i in 1...n {
            let item = Item(context: CoredataUtils.context)
            item.name = "item \(i)"
            CoredataUtils.add(item: item, to: order)
        }
    }
}
