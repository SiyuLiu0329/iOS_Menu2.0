//
//  ViewController.swift
//  Menu2
//
//  Created by Siyu Liu on 16/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    let orderViewController = OrderNavigationController() // keep a reference here so this wont be deinited when dismissed
    
    let button: UIButton = {
        // a button used for dev purpose only, push the order view controller on pressed
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Button", for: .normal)
        button.backgroundColor = .red
        button.tintColor = .white
        return button
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.backgroundColourMain
        button.addTarget(self, action: #selector(self.onButtonPressed), for: .touchUpInside)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 100)
            ])
        
        let initalViewController = OrderViewController()
        orderViewController.viewControllers = [initalViewController]
    }
    
    @objc private func onButtonPressed() {
        present(orderViewController, animated: true, completion: nil)
    }
}

