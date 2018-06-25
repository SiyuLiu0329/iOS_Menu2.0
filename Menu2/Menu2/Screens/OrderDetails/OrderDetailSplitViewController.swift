//
//  OrderDetailSplitViewController.swift
//  Menu2
//
//  Created by Siyu Liu on 23/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class OrderDetailSplitViewController: UISplitViewController, Presentor {
    weak var coordinator: BaseCoordinator? {
        didSet {
            
        }
    }
    
    lazy var masterViewController: UINavigationController = {
        let orderVC = UINavigationController()
        let orderItemsVC = OrderItemsViewController()
        orderVC.viewControllers = [orderItemsVC]
        orderVC.navigationBar.barTintColor = UIColor.themeColour
        orderVC.view.backgroundColor = .white
        orderVC.navigationBar.isTranslucent = false
        return orderVC
    }()
    
    var detailViewController: MenuViewController = {
        let menuVC = MenuViewController()
        return menuVC
    }()
    
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setUpChildViewControllers()
//        view.backgroundColor = .clear // disable default separator colour
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpChildViewControllers() {
        addChild(masterViewController)
        addChild(detailViewController)
    }
}
