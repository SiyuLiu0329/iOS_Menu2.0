//
//  MenuCollectionViewCell.swift
//  Menu2
//
//  Created by Siyu Liu on 29/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    static let cellId = "menuCell"
    var menu: Menu? {
        didSet {
            menuItemCollectionView.reloadData() // solves the collection view within collection view not loading problem
        }
    }
    
    lazy var menuItemCollectionView: MenuItemCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = MenuItemCollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MenuItemCell.self, forCellWithReuseIdentifier: MenuItemCell.cellId)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpCell() {
        
        
        addSubview(menuItemCollectionView)
        NSLayoutConstraint.activate([
            menuItemCollectionView.leftAnchor.constraint(equalTo: leftAnchor),
            menuItemCollectionView.rightAnchor.constraint(equalTo: rightAnchor),
            menuItemCollectionView.topAnchor.constraint(equalTo: topAnchor),
            menuItemCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)])
        layer.addBorder(edge: .right, color: .lightGray, thickness: 0.5, inset: 20)
    }
}
