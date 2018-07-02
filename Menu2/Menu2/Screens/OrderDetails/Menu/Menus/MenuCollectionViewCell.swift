//
//  MenuCollectionViewCell.swift
//  Menu2
//
//  Created by Siyu Liu on 29/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

protocol MenuCollectionViewCellDelegate: class {
    
}

class MenuCollectionViewCell: UICollectionViewCell {
    static let cellId = "menuCell"
    weak var delegate: MenuCollectionViewCellDelegate?
    var menu: Menu? {
        didSet {
            guard let menu = menu else { return }
            menuItemCollectionView.reloadData() // solves the collection view within collection view not loading problem
            sectionTitleView.setTitle(menu.name ?? "Unamed Menu")
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
    
    lazy var sectionTitleView: MenuCollectionViewCellTitleView = {
        let view = MenuCollectionViewCellTitleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpCell() {
        
        addSubview(sectionTitleView)
        NSLayoutConstraint.activate([
            sectionTitleView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            sectionTitleView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            sectionTitleView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            sectionTitleView.heightAnchor.constraint(equalToConstant: 44)])
        
        addSubview(menuItemCollectionView)
        NSLayoutConstraint.activate([
            menuItemCollectionView.leftAnchor.constraint(equalTo: leftAnchor),
            menuItemCollectionView.rightAnchor.constraint(equalTo: rightAnchor),
            menuItemCollectionView.topAnchor.constraint(equalTo: sectionTitleView.bottomAnchor),
            menuItemCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)])
        
        layer.addBorder(edge: .right, color: .lightGray, thickness: 0.5, inset: 12)
    }
}
