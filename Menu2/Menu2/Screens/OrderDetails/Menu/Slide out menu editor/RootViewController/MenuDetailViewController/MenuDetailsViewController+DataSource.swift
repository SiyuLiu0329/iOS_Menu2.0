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
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (model?.items.count ?? 0) + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: AddNewItemTableViewCell.cellId, for: indexPath) as! AddNewItemTableViewCell
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: GenericItemTableViewCell.cellId, for: indexPath) as! GenericItemTableViewCell
        cell.viewModel = model?.getTableViewCellViewModel(forItemAt: indexPath.row - 1)
        return cell
    }
}
