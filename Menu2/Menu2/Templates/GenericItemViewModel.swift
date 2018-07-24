//
//  GenericItemCellViewModel.swift
//  Menu2
//
//  Created by Siyu Liu on 9/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

struct GenericItemViewModel {
    var name: String
    var price: String
    var id: String
    var image: UIImage?
    
    init(item: Item) {
        name = item.name ?? "Unamed Item"
        
        price = String(format: "%.2f", Double(truncating: item.price ?? 0))
        id = item.identifier ?? ""
        if let data = item.imgData {
            image = UIImage(data: data)
        } else {
            image = nil
        }
    }
}
