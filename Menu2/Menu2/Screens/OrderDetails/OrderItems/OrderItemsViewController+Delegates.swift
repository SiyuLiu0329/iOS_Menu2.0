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
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: OrderItemTableViewHeaderView.viewId) as! OrderItemTableViewHeaderView
        if let date = itemModel?.order.timeCreated {
            view.setDate(date)
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            // TODO: provide a better message
            let alert = UIAlertController(title: "Remove Item From Order", message: "Are you sure you want to delete this item.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
                self.itemModel?.removeItem(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                // also need to update the collection view
                
                self.updateSummary()
            }   ))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
                return
            }))
            self.present(alert, animated: true, completion: nil)
        }
        return [delete]
    }
    
}


extension OrderItemsViewController: MenuViewControllerDelegate {
    func didAddItem(item: Item) {
        // Changes not stored atm
        // Idea: duplicate item in the same context as order then modify it there.
        if let res = itemModel?.addItemToOrder(item: item),
            let index = res.index {
            if res.inserted {
                orderItemsTableView.insertRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
            } else {
                orderItemsTableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
            }
            
        }
        
        updateSummary()
        
    }
    
    func updateSummary() {
        guard let order = itemModel?.order else { return }
        orderItemsSummaryView.viewModel = OrderItemsSummaryViewModel(order: order)
    }
}
