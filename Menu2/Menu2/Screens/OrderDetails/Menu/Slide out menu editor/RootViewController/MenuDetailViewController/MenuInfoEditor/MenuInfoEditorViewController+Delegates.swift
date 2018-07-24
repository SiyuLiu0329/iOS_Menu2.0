//
//  MenuInfoEditorViewController+Delegates.swift
//  Menu2
//
//  Created by Siyu Liu on 24/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

extension MenuInfoEditorViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 || indexPath.row == model.menuEditorTextfieldViewModels.count + 1 {
            return 10
            // padding
        }
        return GenericTextFieldCell.preferredCellHeight
    }
}


extension MenuInfoEditorViewController: GenericTextFieldCellDelegate {
    func textDidChange(to newText: String, in cell: GenericTextFieldCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            model.updateText(index: indexPath.row - 1, newValue: newText)
        }
    }
}
