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
        if indexPath.row == 0 {
            return []
        }
        
        let delete = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            let alert = UIAlertController(title: "Delete Menu", message: "Deleting this menu will also remove all the items on this menu.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
                self.menuModel?.deleteMenu(at: indexPath.row - 1)
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
        if indexPath.row == 0 {
            createNewMenu()
            return
        }
        
        guard let menuModel = menuModel else { return }
        showMenuDetailsFor(menu: menuModel.menus[indexPath.row - 1])
    }
    
    private func createNewMenu(){
        let alert = UIAlertController(title: "Create Menu", message: "Enter a name for the menu.", preferredStyle: .alert)
        let submit = UIAlertAction(title: "Submit", style: .default) { (action) in
            if let textfield = alert.textFields?[0] {
                if let menu = self.menuModel?.createNewMenu(with: textfield.text ?? "Unnamed Menu") {
                    self.showMenuDetailsFor(menu: menu)
                    self.tableView.reloadData()
                }
            }
        }
        alert.addAction(submit)
        alert.addTextField { (textfield) in
            textfield.placeholder = "Menu name..."
        }
        present(alert, animated: true, completion: nil)
    }
    
    private func showMenuDetailsFor(menu: Menu) {
        let menuDetailsVC = MenuDetailsViewController(menu: menu)
        menuDetailsVC.menuDetailsDelegate = self
        navigationController?.pushViewController(menuDetailsVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return CreateNewMenuTableViewCell.height
        }
        return 60
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    
    
}


extension MenuEditorMenuTableViewController: MenuInfoEditorViewControllerDelegate {
    func menuInfoDidChange() {
        tableView.reloadData()
    }
}
