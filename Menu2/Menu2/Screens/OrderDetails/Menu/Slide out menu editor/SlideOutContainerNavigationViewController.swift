//
//  SlideOutContainerNavigationViewController.swift
//  Menu2
//
//  Created by Siyu Liu on 3/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class SlideOutContainerNavigationViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor = UIColor.themeColour
        navigationBar.prefersLargeTitles = true
        let key = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationBar.titleTextAttributes = key
        navigationBar.largeTitleTextAttributes = key
    }
}
