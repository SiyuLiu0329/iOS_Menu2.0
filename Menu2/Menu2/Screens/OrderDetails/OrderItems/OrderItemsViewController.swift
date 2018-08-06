//
//  OrderItemsViewController.swift
//  Menu2
//
//  Created by Siyu Liu on 25/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

enum OrderType {
    case new
    case existing
}

protocol OrderItemsViewControllerDelegate: class {
    func didFinishEditing(order: Order)
}

/*
 A view controller responsible for displaying the content in the loaded order.
 Occupies the area on the left side of split view controller
 */
class OrderItemsViewController: UIViewController {
    var itemModel: OrderItemsModel?
    var type: OrderType
    weak var delegate: OrderItemsViewControllerDelegate?
    
    /*
     A simple UIView giving colour to the status bar
     */
    let statusBarBackgroundView: UIView = {
        let view = UIView()
        view.frame = UIApplication.shared.statusBarFrame
        view.backgroundColor = UIColor.themeColour
        return view
    }()
    
    init(type: OrderType) {
        self.type = type
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        view.backgroundColor = .white
        navigationController?.view.addSubview(statusBarBackgroundView)
        layoutViews()
    }
    
    
    lazy var orderItemsTableView: OrderItemsTableView = {
        let tableView = OrderItemsTableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(OrderItemTableViewCell.self, forCellReuseIdentifier: OrderItemTableViewCell.cellId)
        tableView.register(OrderItemTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: OrderItemTableViewHeaderView.viewId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.collectionViewBackgroundColour
        
        return tableView
    }()
    
    lazy var orderItemsSummaryView: OrderItemsSummaryView = {
        let view = OrderItemsSummaryView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private func setUpNavBar() {
        // bar colour
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.topItem?.title = "Order #\(itemModel?.order.number ?? 0)"
        
        // "X" button
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(self.onCancelPressed))
        
        // title colour
        navigationController?.navigationBar.tintColor = UIColor.themeColour
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.themeColour]
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.themeColour]
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    @objc private func onCancelPressed() {
        // notify parent of insertion if this order is a new order.
        // this order is new, give the option to delete (show a dialog "this order is empty, would you like to delete it)
        if let delegate = delegate,
            let order = itemModel?.order,
        type == .new{
            
            // only need to reload collection view when a new order is added
            delegate.didFinishEditing(order: order)
        }
        dismiss(animated: true, completion: nil)
    }
    
    private func layoutViews() {
        view.addSubview(orderItemsTableView)
        view.addSubview(orderItemsSummaryView)
        NSLayoutConstraint.activate([
            orderItemsSummaryView.heightAnchor.constraint(equalToConstant: 200),
            orderItemsSummaryView.leftAnchor.constraint(equalTo: view.leftAnchor),
            orderItemsSummaryView.rightAnchor.constraint(equalTo: view.rightAnchor),
            orderItemsSummaryView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            orderItemsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            orderItemsTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            orderItemsTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            orderItemsTableView.bottomAnchor.constraint(equalTo: orderItemsSummaryView.topAnchor)])
    }
}
