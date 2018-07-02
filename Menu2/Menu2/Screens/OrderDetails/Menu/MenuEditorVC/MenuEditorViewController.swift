//
//  MenuEditorViewController.swift
//  Menu2
//
//  Created by Siyu Liu on 2/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class MenuEditorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.themeColour
        navigationController?.navigationBar.topItem?.title = "Menus"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    


}
