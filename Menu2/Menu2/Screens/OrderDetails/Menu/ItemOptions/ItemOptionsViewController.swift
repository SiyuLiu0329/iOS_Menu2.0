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
    
    var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10;
        view.clipsToBounds = true
        return view
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overCurrentContext
        setUpContentView()
    }
    
    private func setUpContentView() {
        view.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: topBottomMargin),
            contentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: leftRightMargin),
            contentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -leftRightMargin),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -topBottomMargin)])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
