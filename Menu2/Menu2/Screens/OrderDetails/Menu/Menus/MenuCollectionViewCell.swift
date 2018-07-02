//
//  MenuCollectionViewCell.swift
//  Menu2
//
//  Created by Siyu Liu on 29/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit


/*
 This cell holds an entire menu is responsible for presenting the items in this menu.
 - items are placed inside a collection view
 */
class MenuCollectionViewCell: UICollectionViewCell {
    static let cellId = "menuCell"
    var menu: Menu? {
        // update the cell when this value is set
        // this value is set whenever this cell becomes visible
        didSet {
            guard let menu = menu else { return }
            menuItemCollectionView.reloadData() // solves the collection view within collection view not loading problem
            sectionTitleView.setTitle(menu.name ?? "Unamed Menu")
        }
    }
    
    /*
     A collection view responsible for displaying items in this menu
     */
    lazy var menuItemCollectionView: MenuItemCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = MenuItemCollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MenuItemCell.self, forCellWithReuseIdentifier: MenuItemCell.cellId)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    /*
     View at the top of the cell to display the name of the menu
     */
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
            sectionTitleView.heightAnchor.constraint(equalToConstant: 30)])
        
        addSubview(menuItemCollectionView)
        NSLayoutConstraint.activate([
            menuItemCollectionView.leftAnchor.constraint(equalTo: leftAnchor),
            menuItemCollectionView.rightAnchor.constraint(equalTo: rightAnchor),
            menuItemCollectionView.topAnchor.constraint(equalTo: sectionTitleView.bottomAnchor),
            menuItemCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)])
        
        layer.addBorder(edge: .right, color: .lightGray, thickness: 0.5, inset: 35)
    }
}