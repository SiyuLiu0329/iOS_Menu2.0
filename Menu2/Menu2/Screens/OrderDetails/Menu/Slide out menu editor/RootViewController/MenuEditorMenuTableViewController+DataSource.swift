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
        let cell = tableView.dequeueReusableCell(withIdentifier: SlideOutMenuTableViewCell.cellId, for: indexPath) as! SlideOutMenuTableViewCell
        cell.textLabel?.text = menuModel?.menus[indexPath.row].name ?? "Unamed Item"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuModel?.menus.count ?? 0
    }
}
