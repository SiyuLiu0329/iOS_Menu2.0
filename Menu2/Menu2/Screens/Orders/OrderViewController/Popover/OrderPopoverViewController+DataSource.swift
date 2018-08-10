//
//  OrderPopoverViewController+Delegate.swift
//  Menu2
//
//  Created by Siyu Liu on 10/8/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

extension OrderPopoverViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        if indexPath.row == 2 {
            cell.textLabel?.text = "Delete"
        }
        return cell
    }
}
