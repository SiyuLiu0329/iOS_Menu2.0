//
//  ItemDetailsViewController+Delegates.swift
//  Menu2
//
//  Created by Siyu Liu on 8/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

extension ItemDetailsViewController {
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            // preview
            return 180
        }
        
        if indexPath.row == 4 {
            // image picker
            return 90
        }
        
        if indexPath.row == 0 {
            // section 1 padding
            return 10
        
        }
        
        // textfields
        return GenericTextFieldCell.preferredCellHeight
    }
    
}
