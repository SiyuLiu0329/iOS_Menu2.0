//
//  MenuEditorMenuTableViewController.swift
//  Menu2
//
//  Created by Siyu Liu on 4/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

protocol MenuEditorDelegate: class {
    func didExitMenuEditor()
}

class MenuEditorMenuTableViewController: UITableViewController {
    var menuModel: MenuModel?
    weak var menuEditorDelegate: MenuEditorDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(SlideOutMenuTableViewCell.self, forCellReuseIdentifier: SlideOutMenuTableViewCell.cellId)
        tableView.register(CreateNewMenuTableViewCell.self, forCellReuseIdentifier: CreateNewMenuTableViewCell.cellId)
        tableView.backgroundColor = UIColor.collectionViewBackgroundColour
        setUpNavBar()
    }
    

    private func setUpNavBar() {
        navigationController?.navigationBar.topItem?.title = "Menu Editor"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.onClosePressed))
    }

    @objc private func onClosePressed() {
        if let delegate = menuEditorDelegate {
            delegate.didExitMenuEditor()
        }
    }
}
