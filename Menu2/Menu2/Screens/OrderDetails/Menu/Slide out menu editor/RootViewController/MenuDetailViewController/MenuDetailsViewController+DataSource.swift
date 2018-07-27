//
//  MenuDetailsViewController+DataSource.swift
//  Menu2
//
//  Created by Siyu Liu on 7/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

extension MenuDetailsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1 // basic info section
        }
        return (model.items.count) + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            // use the same type of cell for both 
            let cell = tableView.dequeueReusableCell(withIdentifier: AddNewItemTableViewCell.cellId, for: indexPath) as! AddNewItemTableViewCell

            cell.textLabel?.text = indexPath.section == 0 ? "Edit Menu Info" : "✚ Add Item"
            cell.textLabel?.textAlignment = .center
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: GenericItemTableViewCell.cellId, for: indexPath) as! GenericItemTableViewCell
        cell.viewModel = model.getTableViewCellViewModel(forItemAt: indexPath.row - 1)
        return cell
    }
}
