//
//  MenuInfoEditorViewController.swift
//  Menu2
//
//  Created by Siyu Liu on 24/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

protocol MenuInfoEditorViewControllerDelegate: class {
    func menuInfoDidChange()
}

class MenuInfoEditorViewController: UITableViewController {
    
    var model: MenuInfoEditorModel
    
    weak var menuEditorDelegate: MenuInfoEditorViewControllerDelegate?
    
    let paddingCellId = "pad"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(menu: Menu) {
        model = MenuInfoEditorModel(menu: menu)
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor =  UIColor.tableViewHeaderBackgroundColour
        navigationItem.title = "Edit Menu Info"
        tableView.register(GenericTextFieldCell.self, forCellReuseIdentifier: GenericTextFieldCell.cellId)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: paddingCellId)
        tableView.separatorColor = .clear
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(onSavePressed))
    }
    
    @objc private func onSavePressed() {
        model.saveMenuInfo()
        if let delegate = menuEditorDelegate {
            delegate.menuInfoDidChange()
        }
        navigationController?.popViewController(animated: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
