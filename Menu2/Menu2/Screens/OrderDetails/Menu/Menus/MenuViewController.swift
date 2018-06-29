//
//  MenuViewController.swift
//  Menu2
//
//  Created by Siyu Liu on 23/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    let menuModel = MenuModel()
    
    lazy var topBar: PageMenuTitles = {
        let topBarView = PageMenuTitles()
        topBarView.translatesAutoresizingMaskIntoConstraints = false
        return topBarView
    }()
    
    lazy var sectionCollectionView: OrderSectionCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let sectionView = OrderSectionCollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        sectionView.translatesAutoresizingMaskIntoConstraints = false
        sectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.cellId)
        sectionView.dataSource = self
        sectionView.delegate = self
        sectionView.alwaysBounceHorizontal = true
        sectionView.isPagingEnabled = true
        sectionView.showsHorizontalScrollIndicator = false
        sectionView.showsVerticalScrollIndicator = false
        return sectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTopBar()
        // Do any additional setup after loading the view.
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        topBar.titleDelegate = sectionCollectionView
        view.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpTopBar() {
        topBar.titles = menuModel.getMenuTitles()
        view.addSubview(topBar)
        view.bringSubviewToFront(topBar)
        NSLayoutConstraint.activate([
            topBar.topAnchor.constraint(equalTo: view.topAnchor),
            topBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            topBar.rightAnchor.constraint(equalTo: view.rightAnchor),
            topBar.heightAnchor.constraint(equalToConstant: topBar.preferredHeight)
            ])
        
        view.addSubview(sectionCollectionView)
        NSLayoutConstraint.activate([
            sectionCollectionView.topAnchor.constraint(equalTo: topBar.bottomAnchor),
            sectionCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            sectionCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            sectionCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
}
