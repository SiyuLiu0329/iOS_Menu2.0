//
//  MenuEditorMenuTableViewController.swift
//  Menu2
//
//  Created by Siyu Liu on 4/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class MenuEditorMenuTableViewController: UITableViewController {
    var menuModel: MenuModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = "Menu Editor"
        tableView.register(SlideOutMenuTableViewCell.self, forCellReuseIdentifier: SlideOutMenuTableViewCell.cellId)
    }
    

    
    

}
