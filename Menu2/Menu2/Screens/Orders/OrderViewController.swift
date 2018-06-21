//
//  OrderViewController.swift
//  Menu2
//
//  Created by Siyu Liu on 19/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    weak var coordinator: BaseCoordinator?
    lazy var pageMenu: PageMenuRootView = {
        let view = PageMenuRootView()
        view.dataSource = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    deinit {
        print(self, "deinited.")
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.backgroundColourMain
        setUpNavBar()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutViews() {
        view.addSubview(pageMenu)
        NSLayoutConstraint.activate([
            pageMenu.leftAnchor.constraint(equalTo: view.leftAnchor),
            pageMenu.rightAnchor.constraint(equalTo: view.rightAnchor),
            pageMenu.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pageMenu.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        
    }
    
    private func setUpNavBar() {
        navigationItem.title = "Orders"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(self.onCancelPressed))
    }
    
    @objc private func onCancelPressed() {
        dismiss(animated: true, completion: nil)
    }


}
