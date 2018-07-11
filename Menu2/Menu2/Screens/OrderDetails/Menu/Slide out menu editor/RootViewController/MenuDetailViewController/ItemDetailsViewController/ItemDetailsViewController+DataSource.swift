//
//  ItemDetailsViewController+DataSource.swift
//  Menu2
//
//  Created by Siyu Liu on 8/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

extension ItemDetailsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            // preview
            return 1
        }
        
        // 3 text fields + 1 image picker + 1 padding
        return (itemModel?.textFieldViewModels.count ?? 0) + 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // display a preview of the item in section 0
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: headerCellId, for: indexPath) as! ItemPreviewTableViewCell
            cell.viewModel = itemModel?.itemPreviewModel
            return cell
        }
        
        if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ImagePickerTableViewCell.cellId, for: indexPath) as! ImagePickerTableViewCell
            return cell
        }
        
        if indexPath.row == 0 {
            // add padding to the top and bottom of this section
            // use a table view cell instead of header view becuase headers will not scroll together with the cells
            let cell = tableView.dequeueReusableCell(withIdentifier: paddingCellId, for: indexPath)
            cell.contentView.backgroundColor = .white
            cell.selectionStyle = .none
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: GenericTextFieldCell.cellId, for: indexPath) as! GenericTextFieldCell
        cell.viewModel = itemModel?.textFieldViewModels[indexPath.row - 1]
        return cell
    }
}
