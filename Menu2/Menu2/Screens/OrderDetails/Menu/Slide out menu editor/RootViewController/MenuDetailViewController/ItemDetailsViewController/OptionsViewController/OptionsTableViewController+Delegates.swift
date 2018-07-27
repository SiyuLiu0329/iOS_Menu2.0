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
            return 
        }
        
        model.didSelectOption(at: indexPath.row - 1)
        tableView.reloadData()
    }
}
