//
//  OrderItemsSummaryView.swift
//  Menu2
//
//  Created by Siyu Liu on 6/8/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit
/*
 A view at the bottom of the screen. Responsible for showing basic info such as date, total price ...
 */
class OrderItemsSummaryView: UIView {
    
    var viewModel: OrderItemsSummaryViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            payButton.setTitle("Pay \(viewModel.totalPriceText)", for: .normal)
            // TODO do something if price == 0 (gray out pay??)
        }
    }
    
    private let payButtonHeight: CGFloat = 44

    lazy var payButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.onPayButtonPressed), for: .touchUpInside)
        button.backgroundColor = UIColor.themeColour
        
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
            payButton.heightAnchor.constraint(equalToConstant: payButtonHeight)
            ])
    }
    
    @objc private func onPayButtonPressed() {
        // do pay action
    }
    
}
