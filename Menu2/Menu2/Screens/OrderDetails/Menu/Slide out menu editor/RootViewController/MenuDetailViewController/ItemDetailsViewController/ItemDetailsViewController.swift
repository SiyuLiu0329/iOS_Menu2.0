//
//  ItemDetailsViewController.swift
//  Menu2
//
//  Created by Siyu Liu on 8/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class ItemDetailsViewController: UITableViewController {
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let item = item else { return }
        navigationItem.title = item.name ?? "Unamed Item"
    }
}
