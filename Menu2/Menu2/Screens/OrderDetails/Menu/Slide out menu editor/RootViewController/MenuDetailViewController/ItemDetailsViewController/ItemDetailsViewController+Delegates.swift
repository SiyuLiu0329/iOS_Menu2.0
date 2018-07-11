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
        if indexPath.section == 1 {
            // preview
            return 180
        }
        
        if indexPath.row == 4 {
            // image picker
            return 90
        }
        
        if indexPath.row == 0 || indexPath.row == 3 {
            // section 1 padding
            return 10
        
        }
        
        // textfields
        return GenericTextFieldCell.preferredCellHeight
    }
    
    
}

extension ItemDetailsViewController: ImagePickerDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func didChangeImage() {
        tableView.reloadSections([1], with: .none) // image changed, reload the preview
    }
    
    func didReqestCameraRollImage(sourceView: UIView) {
        let imagePicker =  GenericPopOverImagePickerController()
        imagePicker.modalPresentationStyle = .popover
        imagePicker.allowsEditing = true
        imagePicker.popoverPresentationController?.sourceView = sourceView
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        itemModel?.select(image: image)
        tableView.reloadSections([1], with: .none)
        picker.dismiss(animated: true, completion: nil)
    }
}

extension ItemDetailsViewController: GenericTextFieldCellDelegate {
    func textDidChange(to newText: String, in cell: GenericTextFieldCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        // updates could have been done in the cell but that would sacrifice the resuability
        itemModel?.updateTextField(indexed: indexPath.row - 1, with: newText)
        tableView.reloadSections([1], with: .none)
    }
}
