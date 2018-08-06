//
//  OrderItemsSummaryViewModel.swift
//  Menu2
//
//  Created by Siyu Liu on 6/8/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

struct OrderItemsSummaryViewModel {
    var totalPriceText: String
    init(order: Order) {
        var tot: Double = 0
        order.items?.forEach({ (item) in
            if let item = item as? Item {
                tot += Double(truncating: item.price ?? 0) * Double(item.quantity)
            }
        })
        totalPriceText = tot.toPrice()
    }
}
