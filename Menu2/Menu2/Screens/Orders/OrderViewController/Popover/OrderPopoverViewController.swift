//
//  OrderPopoverViewController.swift
//  Menu2
//
//  Created by Siyu Liu on 10/8/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

protocol OrderPopoverViewControllerDelegate: class {
    func didDeleteOrder(in section: String, at index: Int)
}

class OrderPopoverViewController: UITableViewController {
    weak var delegate: OrderPopoverViewControllerDelegate?
    var cellId = "cellId"
    let rowHeight: CGFloat = 60
    let rowWidth: CGFloat = 200
    let order: (section: String, index: Int)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    init(sourceView: UIView, for order: (section: String, index: Int)) {
        self.order = order
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .popover
        popoverPresentationController?.sourceView = sourceView
        popoverPresentationController?.sourceRect = sourceView.bounds
        preferredContentSize = CGSize(width: rowWidth, height: rowHeight * 3)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
