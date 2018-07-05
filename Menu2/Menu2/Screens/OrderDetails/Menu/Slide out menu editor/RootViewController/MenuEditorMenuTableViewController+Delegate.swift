//
//  MenuEditorMenuTableViewController+Delegate.swift
//  Menu2
//
//  Created by Siyu Liu on 4/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

extension MenuEditorMenuTableViewController {
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            let alert = UIAlertController(title: "Delete Menu", message: "Deleting this menu will also remove all the items on this menu.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
                self.menuModel?.deleteMenu(at: indexPath.row)
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
        guard let menuModel = menuModel else { return }
        let menuDetailsVC = MenuDetailsViewController()
        menuDetailsVC.model = MenuEditorModel(menu: menuModel.menus[indexPath.row])
        navigationController?.pushViewController(menuDetailsVC, animated: true)
    }
}
