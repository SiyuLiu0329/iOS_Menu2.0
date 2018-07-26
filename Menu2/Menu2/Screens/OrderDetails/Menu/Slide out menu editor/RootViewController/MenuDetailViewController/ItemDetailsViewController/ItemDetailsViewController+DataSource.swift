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
        if section == 1 {
            // preview
            return 1
        }
        
        // 2 text fields + 1 image picker + 2 padding + options
        return (itemModel?.textFieldViewModels.count ?? 0) + 3 + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // display a preview of the item in section 0
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: headerCellId, for: indexPath) as! ItemPreviewTableViewCell
            cell.viewModel = itemModel?.itemPreviewModel
            return cell
        }
        
        if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ImagePickerTableViewCell.cellId, for: indexPath) as! ImagePickerTableViewCell
            cell.itemEditorModel = itemModel
            cell.imagePickerDelegate = self
            return cell
        }
        
        if indexPath.row == 0 || indexPath.row == 4 {
            // add padding to the top and bottom of this section
            // use a table view cell instead of header view becuase headers will not scroll together with the cells
            let cell = tableView.dequeueReusableCell(withIdentifier: regularaCellId, for: indexPath)
            cell.contentView.backgroundColor = .white
            cell.selectionStyle = .none
            cell.textLabel?.text = ""
            cell.accessoryType = .none
            return cell
        }
        
        if indexPath.row == 6 {
            // reveil more options
            let cell = tableView.dequeueReusableCell(withIdentifier: regularaCellId, for: indexPath)
            cell.selectionStyle = .gray
            cell.textLabel?.text = "Options or sides"
            cell.accessoryType = .disclosureIndicator
            return cell
        }
        
        // textfields
        let cell = tableView.dequeueReusableCell(withIdentifier: GenericTextFieldCell.cellId, for: indexPath) as! GenericTextFieldCell
        cell.delegate = self
        cell.viewModel = itemModel?.textFieldViewModels[indexPath.row - 1] // account for padding
        return cell
    }
}
