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
    }
    
    private func setUpNavBar() {
        navigationController?.navigationBar.topItem?.title = "Items"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(self.onCancelPressed))
    }
    
    @objc private func onCancelPressed() {
        dismiss(animated: true, completion: nil)
    }
}
