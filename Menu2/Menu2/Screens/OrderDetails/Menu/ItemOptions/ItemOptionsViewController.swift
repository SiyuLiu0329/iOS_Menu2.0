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
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(UIColor.themeColour, for: .normal)
        button.setTitleColor(UIColor.themeColour.withAlphaComponent(0.3), for: .highlighted)
        button.addTarget(self, action: #selector(onCancelPressed), for: .touchUpInside)
        return button
    }()
    
    @objc private func onCancelPressed() {
        dismiss(animated: true, completion: nil)
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overCurrentContext
        
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        
        setUpViews()
    }
    
    func setUpViews() {
        view.addSubview(cancelButton)
        NSLayoutConstraint.activate([
            cancelButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            cancelButton.heightAnchor.constraint(equalToConstant: 30),
            cancelButton.widthAnchor.constraint(equalToConstant: 60)])
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
