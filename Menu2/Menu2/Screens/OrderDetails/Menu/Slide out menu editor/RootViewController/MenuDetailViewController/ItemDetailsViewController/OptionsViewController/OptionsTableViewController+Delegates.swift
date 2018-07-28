//
//  OptionsTableViewController+Delegates.swift
//  Menu2
//
//  Created by Siyu Liu on 26/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

extension OptionsTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            // add an option
            addAnOption()
            return 
        }
        
        model.didSelectOption(at: indexPath.row - 1)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        if indexPath.row == 0 {
            return []
        }
        
        let delete = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            let alert = UIAlertController(title: "Delete Item", message: "Are you sure?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
                // delete
                self.model.deleteOption(index: indexPath.row - 1)
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
    
    private func addAnOption() {
        let alert = UIAlertController(title: "Create Option", message: "Give a name and a price.", preferredStyle: .alert)
        let submit = UIAlertAction(title: "Okay", style: .default) { (action) in
            guard let name = alert.textFields?.first?.text,
                let price = alert.textFields?[1].text,
                !name.isEmpty else { return } // name cannot be empty
            
            if let newIndex = self.model.insertOption(name: name, price: Float(price) ?? 0 ) {
                
                self.tableView.performBatchUpdates({
                    self.tableView.insertRows(at: [IndexPath(row: newIndex + 1, section: 0)], with: .automatic)
                    self.tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
                }, completion: nil)
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
            // make sure the cell is not selected
            self.tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .none)
            
        }
        alert.addAction(cancel)
        alert.addAction(submit)
        alert.addTextField { (textfield) in
            textfield.placeholder = "Option name..."
        }
        
        alert.addTextField { (textfield) in
            textfield.placeholder = "Price"
            textfield.keyboardType = .numberPad
            textfield.delegate = self
        }
        present(alert, animated: true, completion: nil)
    }
}

extension OptionsTableViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let formatter = NumberFormatter()
        if textField.keyboardType == .default {
            return true
        }
        
        if string.count == 0 || (string=="-" && range.location==0) {
            return true // allow backspace and negative sign at the start
        }
        
        return formatter.number(from: "\(textField.text!)\(string)") != nil
        
    }
}
