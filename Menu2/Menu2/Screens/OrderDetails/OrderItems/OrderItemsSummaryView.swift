//
//  OrderItemsSummaryView.swift
//  Menu2
//
//  Created by Siyu Liu on 6/8/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class OrderItemsSummaryView: UIView {
    
    private let payButtonHeight: CGFloat = 44

    lazy var payButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.onPayButtonPressed), for: .touchUpInside)
        button.backgroundColor = UIColor.themeColour
        button.setTitle("Pay", for: .normal)
        button.tintColor = .white
        return button
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        setUpViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        addSubview(payButton)
        NSLayoutConstraint.activate([
            payButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            payButton.leftAnchor.constraint(equalTo: leftAnchor),
            payButton.rightAnchor.constraint(equalTo: rightAnchor),
            payButton.heightAnchor.constraint(equalToConstant: payButtonHeight)])
        
    }
    
    @objc private func onPayButtonPressed() {
        
    }
    
}
