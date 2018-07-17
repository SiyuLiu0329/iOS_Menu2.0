//
//  MenuDetailsViewController+Delegates.swift
//  Menu2
//
//  Created by Siyu Liu on 7/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

extension MenuDetailsViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return AddNewItemTableViewCell.preferredCellHeight
        }
        return GenericItemTableViewCell.preferredCellHeight
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        if indexPath.section == 0 {
            return []
        }
        let delete = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            let alert = UIAlertController(title: "Delete Item", message: "Are you sure?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
                self.model?.deleteItem(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                // also need to update the collection view
            }   ))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
                return
            }))
            self.present(alert, animated: true, completion: nil)
        }
        return [delete]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentItemVC(for: indexPath.section == 0 ? nil : indexPath)
    }
    
    func presentItemVC(for indexPath: IndexPath?) {
        let itemDetailsVC = ItemDetailsViewController()
        guard let menu = model?.menu else { return }
        if let indexPath = indexPath {
            guard let item = model?.items[indexPath.row] else { return }
            itemDetailsVC.itemModel = ItemEditorModel(item: item, menu: menu)
            
        } else {
            itemDetailsVC.itemModel = ItemEditorModel(menu: menu)
        }
        
        navigationController?.pushViewController(itemDetailsVC, animated: true)
    }
}
