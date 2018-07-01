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
    
    lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.themeColour, for: .normal)
        button.setTitleColor(UIColor.themeColour.withAlphaComponent(0.4), for: UIControl.State.highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.onEditPressed), for: .touchUpInside)
        button.setTitle("Edit Menu", for: .normal)
        return button
    }()
    
    @objc private func onEditPressed() {
        
    }
    
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
            menuItemCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant:-44)])
        
        addSubview(editButton)
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: menuItemCollectionView.bottomAnchor),
            editButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            editButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            editButton.widthAnchor.constraint(equalToConstant: 100)])
        
        layer.addBorder(edge: .right, color: .lightGray, thickness: 0.5, inset: 20)
    }
}
