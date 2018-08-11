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
        options = item.options?.allObjects as! [Option]
        options = options.sorted(by: {$0.name! < $1.name!})
    }
    
    func getViewModelForOption(at index: Int) -> OptionTableViewCellViewModel {
        let option = options[index]
        return OptionTableViewCellViewModel.init(name: option.name ?? "", price: 9.99)
    }
    
    func insertOption(name: String, price: Float) -> Int? {
        let option = CoredataUtils.insertOption(named: name, price: price, into: item)
        loadOptions()
        return options.firstIndex(of: option)
    }
    
    func deleteOption(index: Int) {
        CoredataUtils.delete(option: options.remove(at: index))
        loadOptions()
    }
    
    
}
