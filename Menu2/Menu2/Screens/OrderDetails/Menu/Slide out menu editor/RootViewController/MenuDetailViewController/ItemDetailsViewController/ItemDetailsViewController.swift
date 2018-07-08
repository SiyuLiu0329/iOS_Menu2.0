//
//  ItemDetailsViewController.swift
//  Menu2
//
//  Created by Siyu Liu on 8/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class ItemDetailsViewController: UITableViewController {
    var itemModel: ItemEditorModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let itemModel = itemModel else { return }
        tableView.register(GenericTextFieldCell.self, forCellReuseIdentifier: GenericTextFieldCell.cellId)
        tableView.backgroundColor = UIColor.collectionViewBackgroundColour
        tableView.separatorColor = .clear
        navigationItem.title = itemModel.textFieldViewModels[0].value ?? "Unamed Item"
    }
}
