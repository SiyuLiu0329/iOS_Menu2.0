//
//  OrderCollectionViewCell.swift
//  Menu2
//
//  Created by Siyu Liu on 22/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class OrderCollectionViewCell: UICollectionViewCell {
    let cellId = "cellId"
    let cellWidth: CGFloat = 150
    lazy private var orderSectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(OrderCell.self, forCellWithReuseIdentifier: cellId)
        return collectionView
    }()
    
    let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0.6
        return view
    }()
    
    let sectionTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.text = "Section 1"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutSectionView()
        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutSectionView() {
        addSubview(orderSectionView)
        NSLayoutConstraint.activate([
            orderSectionView.topAnchor.constraint(equalTo: topAnchor),
            orderSectionView.leftAnchor.constraint(equalTo: leftAnchor),
            orderSectionView.rightAnchor.constraint(equalTo: rightAnchor),
            orderSectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        
        addSubview(divider)
        NSLayoutConstraint.activate([
            divider.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            divider.rightAnchor.constraint(equalTo: rightAnchor, constant: -25),
            divider.topAnchor.constraint(equalTo: topAnchor),
            divider.heightAnchor.constraint(equalToConstant: 0.3)
            ])
        
        addSubview(sectionTitle)
        NSLayoutConstraint.activate([
            sectionTitle.topAnchor.constraint(equalTo: topAnchor),
            sectionTitle.rightAnchor.constraint(equalTo: rightAnchor),
            sectionTitle.leftAnchor.constraint(equalTo: divider.leftAnchor, constant: 15),
            sectionTitle.heightAnchor.constraint(equalToConstant: 44)])
    }
}