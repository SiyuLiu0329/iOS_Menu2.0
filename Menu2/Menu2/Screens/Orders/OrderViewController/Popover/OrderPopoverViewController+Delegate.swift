//
//  OrderPopoverViewController+Delegate.swift
//  Menu2
//
//  Created by Siyu Liu on 10/8/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

extension OrderPopoverViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
}
