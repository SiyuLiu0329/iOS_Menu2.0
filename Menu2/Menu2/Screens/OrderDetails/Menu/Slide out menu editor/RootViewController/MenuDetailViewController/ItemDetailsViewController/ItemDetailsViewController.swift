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
    
    let paddingCellId = "pad"
    let headerCellId = "header"
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let itemModel = itemModel else { return }
        setUpNavBar()
        tableView.register(GenericTextFieldCell.self, forCellReuseIdentifier: GenericTextFieldCell.cellId)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: paddingCellId)
        tableView.register(ItemPreviewTableViewCell.self, forCellReuseIdentifier: headerCellId)
        tableView.backgroundColor = UIColor.collectionViewBackgroundColour
        tableView.separatorColor = .clear
        navigationItem.title = itemModel.textFieldViewModels[0].value
    }
    
    private func setUpNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(self.onSavePressed))
    }
    
    @objc private func onSavePressed() {
        // get inputs from textfields...
    }
}
