//
//  MenuInfoEditorViewController+DataSource.swift
//  Menu2
//
//  Created by Siyu Liu on 24/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

extension MenuInfoEditorViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + 2 // 2 paddings
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 || indexPath.row == model.menuEditorTextfieldViewModels.count + 1 {
            // padding
            let cell = tableView.dequeueReusableCell(withIdentifier: paddingCellId, for: indexPath)
            cell.selectionStyle = .none
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: GenericTextFieldCell.cellId, for: indexPath) as! GenericTextFieldCell
        cell.viewModel = model.menuEditorTextfieldViewModels[indexPath.row - 1]
        cell.delegate = self
        
        return cell
    }
    

}
