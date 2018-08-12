//
//  ItemOptionsViewController.swift
//  Menu2
//
//  Created by Siyu Liu on 12/8/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class ItemOptionsViewController: UIViewController {

    private let leftRightMargin: CGFloat = 100;
    private let topBottomMargin: CGFloat = 100;
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overCurrentContext
        
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
