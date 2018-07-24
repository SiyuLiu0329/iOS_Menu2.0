//
//  MenuInfoEditorViewController.swift
//  Menu2
//
//  Created by Siyu Liu on 24/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class MenuInfoEditorViewController: UITableViewController {
    
    private var model: MenuInfoEditorModel

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(menu: Menu) {
        model = MenuInfoEditorModel(menu: menu)
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor =  UIColor.tableViewHeaderBackgroundColour
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
