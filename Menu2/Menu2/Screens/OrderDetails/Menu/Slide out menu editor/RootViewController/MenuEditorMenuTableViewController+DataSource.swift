//
//  MenuEditorMenuTableViewController+DataSource.swift
//  Menu2
//
//  Created by Siyu Liu on 4/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

extension MenuEditorMenuTableViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CreateNewMenuTableViewCell.cellId, for: indexPath) as! CreateNewMenuTableViewCell
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SlideOutMenuTableViewCell.cellId, for: indexPath) as! SlideOutMenuTableViewCell
        cell.textLabel?.text = menuModel?.menus[indexPath.row - 1].name ?? "Unamed Menu"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (menuModel?.menus.count ?? 0) + 1
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
