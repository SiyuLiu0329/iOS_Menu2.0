//
//  GenericItemTableViewCellViewModel.swift
//  Menu2
//
//  Created by Siyu Liu on 8/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

struct GenericItemTableViewCellViewModel {
    var image: UIImage
    var title: String
    var subTitle: String
    var acessoryType: UITableViewCell.AccessoryType
    var backgroundColor: UIColor
    var textColor: UIColor
    
    init(item: Item) {
        title = item.name ?? "Unamed Item"
        subTitle = (item.price == nil) ? "$0" : "$\(item.price!)"
        acessoryType = .disclosureIndicator
        textColor = .black
        backgroundColor = .white
        
        if let data = item.imgData {
            image = UIImage(data: data)!
        } else {
            image = UIImage(named: "food_placeholder")!
        }
    }
}
