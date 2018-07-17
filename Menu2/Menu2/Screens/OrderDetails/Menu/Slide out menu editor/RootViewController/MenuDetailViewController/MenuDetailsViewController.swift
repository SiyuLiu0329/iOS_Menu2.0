//
//  MenuDetailsViewController.swift
//  Menu2
//
//  Created by Siyu Liu on 6/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class MenuDetailsViewController: UITableViewController {
    var model: ItemModel? {
        didSet {
            guard let model = model else { return }
            navigationItem.title = model.menu.name ?? "Unamed Menu"
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.collectionViewBackgroundColour
        tableView.register(GenericItemTableViewCell.self, forCellReuseIdentifier: GenericItemTableViewCell.cellId)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
