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
        return model.options.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
            cell.textLabel?.text = "✚ New Option"
            cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.textColor = UIColor.themeColour
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: OptionTableViewCell.cellId, for: indexPath) as! OptionTableViewCell
        
        cell.viewModel = model.getViewModelForOption(at: indexPath.row - 1)
        return cell
    }
}
