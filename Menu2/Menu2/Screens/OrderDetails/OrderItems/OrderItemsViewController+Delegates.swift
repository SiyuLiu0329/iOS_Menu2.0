//
//  OrderItemsViewController+Delegates.swift
//  Menu2
//
//  Created by Siyu Liu on 30/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

extension OrderItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: OrderItemTableViewHeaderView.viewId)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }


}


extension OrderItemsViewController: MenuViewControllerDelegate {
    func didAddItem(item: Item) {
        // Changes not stored atm
        // Idea: duplicate item in the same context as order then modify it there.
        if let newIndex = itemModel?.addItemToOrder(item: item) {
            orderItemsTableView.insertRows(at: [IndexPath(row: newIndex, section: 0)], with: .automatic)
        }
    }
}
