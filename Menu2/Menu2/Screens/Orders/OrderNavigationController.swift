//
//  OrderViewController.swift
//  Menu2
//
//  Created by Siyu Liu on 19/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class OrderNavigationController: UINavigationController, Presentor {
    weak var coordinator: BaseCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.backgroundColourMain
        navigationBar.barTintColor = UIColor.themeColour
    }
}

