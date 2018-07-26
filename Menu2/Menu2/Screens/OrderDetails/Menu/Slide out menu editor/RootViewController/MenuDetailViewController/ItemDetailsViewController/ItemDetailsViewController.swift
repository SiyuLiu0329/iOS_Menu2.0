//
//  ItemDetailsViewController.swift
//  Menu2
//
//  Created by Siyu Liu on 8/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit


protocol ItemDetailsViewControllerDelegate: class {
    func didChangeItem(item: Item, isItemNew: Bool)
}

class ItemDetailsViewController: UITableViewController {
    var itemModel: ItemEditorModel?
    weak var delegate: ItemDetailsViewControllerDelegate?
    let regularaCellId = "pad"
    let headerCellId = "header"
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let itemModel = itemModel else { return }
        setUpNavBar()
        tableView.register(GenericTextFieldCell.self, forCellReuseIdentifier: GenericTextFieldCell.cellId)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: regularaCellId)
        tableView.register(ImagePickerTableViewCell.self, forCellReuseIdentifier: ImagePickerTableViewCell.cellId)
        tableView.register(ItemPreviewTableViewCell.self, forCellReuseIdentifier: headerCellId)
        tableView.backgroundColor = UIColor.collectionViewBackgroundColour
        tableView.separatorColor = .clear
        navigationItem.title = itemModel.textFieldViewModels[0].value
        
    }
    
    private func setUpNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(self.onSavePressed))
        let customBackButton = UIBarButtonItem(image: UIImage(named: "backArrow") , style: .plain, target: self, action: #selector(self.onBackPressed))

        customBackButton.imageInsets = UIEdgeInsets(top: 2, left: -8, bottom: 0, right: 0)
        navigationItem.leftBarButtonItem = customBackButton
    }
    
    
    
    @objc func onBackPressed() {
        // discard changes
        guard let item = itemModel?.item else { return }
        if item.hasChanges {
            CoredataUtils.context.refresh(item, mergeChanges: false)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    @objc private func onSavePressed() {
        guard let delegate = delegate else { return }
        guard let itemChanged = itemModel?.commitChanges() else { return }
        guard let model = itemModel else { return }
        
        // index...
        // delegate.didModifyItem(modificationType: ??)
        
        navigationController?.popViewController(animated: true)
        
        delegate.didChangeItem(item: itemChanged, isItemNew: model.isItemNew)
    }
}
