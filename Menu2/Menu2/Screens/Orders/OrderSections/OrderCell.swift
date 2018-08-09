//
//  OrderCell.swift
//  Menu2
//
//  Created by Siyu Liu on 22/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class OrderCell: UICollectionViewCell {
    let margin: CGFloat = 10
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutViews()
    }
    
    let orderNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.layer.borderColor = UIColor.themeColour.cgColor
//        label.layer.borderWidth = 1
        label.backgroundColor = UIColor.themeColour.withAlphaComponent(0.1)
        label.layer.cornerRadius = 16
        label.clipsToBounds = true
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 44, weight: .thin)
        return label
    }()
    
    let timeLable: UILabel = {
        let label = UILabel()
        label.text = "Created 17:55pm"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.alpha = 0.6
        label.textAlignment = .center
        return label
    }()
    
    let tableLabel: UILabel = {
        let label = UILabel()
        label.text = "Table T3"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.alpha = 0.6
        label.textAlignment = .center
        return label
    }()
    
    var order: Order? {
        didSet {
            guard let order = order else { return }
            loadOrder(from: order)
        }
    }
    
    private func loadOrder(from data: Order) {
        orderNumberLabel.text = "\(data.number)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutViews() {
        addSubview(orderNumberLabel)
        NSLayoutConstraint.activate([
            orderNumberLabel.topAnchor.constraint(equalTo: topAnchor, constant: margin * 3.5),
            orderNumberLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: margin),
            orderNumberLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -margin),
            orderNumberLabel.heightAnchor.constraint(equalToConstant: frame.width - margin * 2)
            ])
        
        addSubview(timeLable)
        NSLayoutConstraint.activate([
            timeLable.topAnchor.constraint(equalTo: orderNumberLabel.bottomAnchor, constant: 5),
            timeLable.leftAnchor.constraint(equalTo: orderNumberLabel.leftAnchor, constant: 8),
            timeLable.rightAnchor.constraint(equalTo: orderNumberLabel.rightAnchor),
            timeLable.heightAnchor.constraint(equalToConstant: 15 )])
        
        addSubview(tableLabel)
        NSLayoutConstraint.activate([
            tableLabel.topAnchor.constraint(equalTo: timeLable.bottomAnchor),
            tableLabel.leftAnchor.constraint(equalTo: timeLable.leftAnchor),
            tableLabel.rightAnchor.constraint(equalTo: timeLable.rightAnchor),
            tableLabel.heightAnchor.constraint(equalToConstant: 15)])
    }
    
}
