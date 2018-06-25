//
//  MenuViewController.swift
//  Menu2
//
//  Created by Siyu Liu on 23/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    lazy var topBar: UIScrollView = {
        let topBarView = UIScrollView()
        topBarView.backgroundColor = UIColor.themeColour
        topBarView.translatesAutoresizingMaskIntoConstraints = false
        return topBarView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTopBar()
        // Do any additional setup after loading the view.
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpTopBar() {
        view.addSubview(topBar)
        view.bringSubviewToFront(topBar)
        NSLayoutConstraint.activate([
            topBar.topAnchor.constraint(equalTo: view.topAnchor),
            topBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            topBar.rightAnchor.constraint(equalTo: view.rightAnchor),
            topBar.heightAnchor.constraint(equalToConstant: 64)
            ])
    }
}
