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
        tableView.register(GenericTextFieldCell.self, forCellReuseIdentifier: GenericTextFieldCell.cellId)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: regularaCellId)
        tableView.register(ImagePickerTableViewCell.self, forCellReuseIdentifier: ImagePickerTableViewCell.cellId)
        tableView.register(ItemPreviewTableViewCell.self, forCellReuseIdentifier: headerCellId)
        tableView.backgroundColor = UIColor.collectionViewBackgroundColour
        tableView.separatorColor = .clear
        navigationItem.title = itemModel.textFieldViewModels[0].value
        
    }
    

    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let delegate = delegate else { return }
        guard let itemChanged = itemModel?.commitChanges() else { return }
        guard let model = itemModel else { return }
        delegate.didChangeItem(item: itemChanged, isItemNew: model.isItemNew)
    }
   
}
