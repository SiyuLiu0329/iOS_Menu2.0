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
        
        //TODO: remove force unwrapping later
        itemsInOrder = itemsInOrder.sorted(by: {$0.name! < $1.name!})
    }
    
    func addItemToOrder(item: Item) -> Int? {
        itemsInOrder.append(item)
        
        CoredataUtils.insert(item: item, into: order)
        //TODO: remove force unwrapping later
        itemsInOrder = itemsInOrder.sorted(by: {$0.name! < $1.name!})
        return itemsInOrder.firstIndex(where: {$0 == item})
    }
    
    func removeItem(at index: Int) {
        let item = itemsInOrder.remove(at: index)
        CoredataUtils.removeItemFromOrder(item: item)
    }
}
