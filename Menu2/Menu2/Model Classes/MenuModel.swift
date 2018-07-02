//
//  MenuModel.swift
//  Menu2
//
//  Created by Siyu Liu on 27/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import Foundation
import CoreData

class MenuModel {
    private let context = CoredataUtils.context
    var menus = [Menu]()
    var selectedMenu = 0
    var numberOfMenus: Int {
        return menus.count
    }
    
    
    
    init() {
        if let loadedMenus = CoredataUtils.loadAllMenus() {
            menus = loadedMenus
            
        }
    }
    
    func getMenuTitles() -> [String] {
        var titles = [String]()
        menus.forEach({titles.append($0.name ?? "Unamed")})
        return titles
    }
    
    
}


