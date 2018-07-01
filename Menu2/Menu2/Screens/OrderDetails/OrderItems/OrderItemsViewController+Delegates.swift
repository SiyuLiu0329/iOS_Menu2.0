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
    
    
}
