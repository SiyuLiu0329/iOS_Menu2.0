//
//  OrderItemsViewController+DataSource.swift
//  Menu2
//
//  Created by Siyu Liu on 30/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

extension OrderItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemModel?.itemsInOrder.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderItemTableViewCell.cellId, for: indexPath) as! OrderItemTableViewCell
        if let model = itemModel {
            cell.viewModel = model.getViewModelForItem(at: indexPath.row)
        }
        return cell
    }
}
