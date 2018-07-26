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
            return 280
        }
        
        if indexPath.row == 5 {
            // image picker
            return 90
        }
        
        if indexPath.row == 0 || indexPath.row == 4 {
            // section 1 padding
            return 10
        
        }
        
        if indexPath.row == 6 {
            return 44
        }
        
        // textfields
        return GenericTextFieldCell.preferredCellHeight
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row == 6 else { return }
        showOptions()
    }
    
    private func showOptions() {
        guard let item = itemModel?.item else { return }
        let vc = OptionsTableViewController(for: item)
        
        navigationController?.pushViewController(vc, animated: true)
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
        tableView.reloadSections([1], with: .none) // section 1 is the preview
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
