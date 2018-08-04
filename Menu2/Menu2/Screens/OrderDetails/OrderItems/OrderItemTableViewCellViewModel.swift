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
    
    init(item: Item) {
        name = item.name ?? "Unnamed Item"
    }
}
