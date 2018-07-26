//
//  OptionsModel.swift
//  Menu2
//
//  Created by Siyu Liu on 26/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import Foundation

class OptionsModel {
    var options = [Option]()
    var item: Item
    init(for item: Item) {
//        testInsertOptions()
        self.item = item
        loadOptions()
    
    }
    
    func loadOptions() {
        options = CoredataUtils.fetchOptions() ?? []
        options = options.sorted(by: {$0.name! < $1.name!})
    }
    
    func didSelectOption(at index: Int) {
        guard let itemOption = item.options else { return }
        let option = options[index]
        if itemOption.contains(option) {
            item.removeFromOptions(option)
        } else {
            item.addToOptions(option)
        }
    }
    
    
}


extension OptionsModel {
    func testInsertOptions() {
        (1...20).forEach({CoredataUtils.insertOption(named: "Option \($0)", price: Float($0))})
    }
}
