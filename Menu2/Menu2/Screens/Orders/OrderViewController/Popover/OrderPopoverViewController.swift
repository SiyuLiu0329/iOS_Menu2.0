//
//  OrderPopoverViewController.swift
//  Menu2
//
//  Created by Siyu Liu on 10/8/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class OrderPopoverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    init(sourceView: UIView) {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .popover
        popoverPresentationController?.sourceView = sourceView
        popoverPresentationController?.sourceRect = sourceView.bounds
        preferredContentSize = CGSize(width: 400, height: 300)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
