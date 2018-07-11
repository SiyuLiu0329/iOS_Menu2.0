//
//  GenericItemCellViewModel.swift
//  Menu2
//
//  Created by Siyu Liu on 9/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

struct GenericItemViewModel {
    let name: String
    let price: String
    let image: UIImage?
    
    init(item: Item) {
        name = item.name ?? "Unamed Item"
        price = (item.price == nil) ? "0" : "\(item.price!)"
        image = nil
    }
}
