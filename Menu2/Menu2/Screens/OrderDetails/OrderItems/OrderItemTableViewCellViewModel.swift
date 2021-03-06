//
//  OrderItemTableViewCellViewModel.swift
//  Menu2
//
//  Created by Siyu Liu on 4/8/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

struct OrderItemTableViewCellViewModel {
    let name: String
    let price: String
    let quantity: String
    
    init(item: Item) {
        name = item.name ?? "Unnamed Item"
        price = (Double(truncating: item.price ?? 0) * Double(item.quantity)).toPrice()
        quantity = String(item.quantity)
    }
}
