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
    case createNew = "Create New"
    case all = "All"
    case inProgress = "In Progress"
    case completed = "Completed"
    case bookings = "Bookings - Not Arrived"
    
    
    case paidAndServed = "pns"
    case servedButRefunded = "sbr"
}

class OrderModel {
    private var shift: Shift?
    var sections: [OrderSection] = [
        (sectionName: SectionName.createNew.rawValue, orders: []),
        (sectionName: SectionName.inProgress.rawValue, orders: []),
        (sectionName: SectionName.bookings.rawValue, orders: []),
        (sectionName: SectionName.completed.rawValue, orders: []),
        (sectionName: SectionName.all.rawValue, orders: []),
    ]
    
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
        CoredataUtils.insertOrder(into: shift, number: 8, paid: true, served: false, refunded: false, isBooking: false, bookingArrived: false)
        if let orders = shift.orders {
            orders.forEach { (obj) in
                let order = obj as! Order
                if order.paid && order.served {
                    sections[3].orders.append(order) // completed
                } else {
                    
                    if order.isBooking && !order.bookingArrived {
                        sections[2].orders.append(order)
                    } else {
                        sections[1].orders.append(order) // not completed
                    }
                }
                
                sections[4].orders.append(order) // All
                
            }
        }
    }
    
}
