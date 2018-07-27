//
//  OptionsTableViewController.swift
//  Menu2
//
//  Created by Siyu Liu on 26/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class OptionsTableViewController: UITableViewController {
    var model: OptionsModel
    let cellId = "new"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.register(OptionTableViewCell.self, forCellReuseIdentifier: OptionTableViewCell.cellId)
        navigationItem.title = "All Options And Sides"
    }
    
    init(for item: Item) {
        model = OptionsModel(for: item)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
