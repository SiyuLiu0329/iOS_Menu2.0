//
//  OrderItemsViewController.swift
//  Menu2
//
//  Created by Siyu Liu on 25/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class OrderItemsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        view.backgroundColor = .white
    }
    
    private func setUpNavBar() {
        navigationController?.navigationBar.barTintColor = UIColor.themeColour
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.topItem?.title = "Items"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(self.onCancelPressed))
    }
    
    @objc private func onCancelPressed() {
        dismiss(animated: true, completion: nil)
    }
}
