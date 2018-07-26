//
//  OptionsTableViewController+DataSouce.swift
//  Menu2
//
//  Created by Siyu Liu on 26/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

extension OptionsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.options.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)

        cell.textLabel?.text = model.options[indexPath.row].name ?? "Unnamed"
        
        // debug -> use a view model later
        if let itemOptions = model.item.options {
            if itemOptions.contains(model.options[indexPath.row]) {
                cell.contentView.backgroundColor = .gray
            } else {
                cell.contentView.backgroundColor = .white
            }
        }

        return cell
    }
}
