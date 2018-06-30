//
//  OrderItemsViewController.swift
//  Menu2
//
//  Created by Siyu Liu on 25/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class OrderItemsViewController: UIViewController {
    var order: Order?
    
    let statusBarBackgroundView: UIView = {
        let view = UIView()
        view.frame = UIApplication.shared.statusBarFrame
        view.backgroundColor = UIColor.themeColour
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        print(order?.items?.count)
        view.backgroundColor = .white
        navigationController?.view.addSubview(statusBarBackgroundView)
        layoutViews()
    }
    
    let orderItemsTableView: OrderItemsTableView = {
        let tableView = OrderItemsTableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private func setUpNavBar() {
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.topItem?.title = "Order #\(order?.number ?? 0)"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(self.onCancelPressed))
        
        // title colour
        navigationController?.navigationBar.tintColor = UIColor.themeColour
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.themeColour]
        

        // add drop shadow to the nav bar
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.6
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 4
        
    }
    
    @objc private func onCancelPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    private func layoutViews() {
        view.addSubview(orderItemsTableView)
        NSLayoutConstraint.activate([
            orderItemsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            orderItemsTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            orderItemsTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            orderItemsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
}
