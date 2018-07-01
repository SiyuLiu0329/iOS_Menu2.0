//
//  OrderItemsModel.swift
//  Menu2
//
//  Created by Siyu Liu on 1/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import Foundation
import CoreData


class OrderItemsModel {
    var order: Order
    var itemsInOrder = [Item]()
    
    init(order: Order) {
        self.order = order
        unpackOrder()
    }
    
    // loads all the items in this order to an array
    private func unpackOrder() {
        if let items = order.items {
            items.forEach({itemsInOrder.append($0 as! Item)})
        }
    }
}
