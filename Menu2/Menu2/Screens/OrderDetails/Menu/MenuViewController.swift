//
//  MenuViewController.swift
//  Menu2
//
//  Created by Siyu Liu on 23/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

/*
 A view controller responsible for displaying all menu related items. Holds
 - a horizontal scrolling collection view for menus
 - a bottom bar as page menu, also a horizontal scrolling collection view
 - a cog gear icon to invoke menu setting vc
 Occupying the right side of the split view controller
 */
class MenuViewController: UIViewController {
    let menuModel = MenuModel()
    
    let statusBarBackgroundView: UIView = {
        let view = UIView()
        view.frame = UIApplication.shared.statusBarFrame
        view.backgroundColor = UIColor.themeColour
        return view
    }()
    
    /*
     Page menu at the bottom of the screen
     */
    lazy var titleCollectionView: MenuTitleCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = MenuTitleCollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MenuTitleCollectionViewCell.self, forCellWithReuseIdentifier: MenuTitleCollectionViewCell.cellId)
        return collectionView
    }()
    
    /*
     Collection view responsible for displaying menu items, there is a child collection view in this collection view
     */
    lazy var menuCollectionView: MenuCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let sectionView = MenuCollectionView(frame: CGRect.zero, collectionViewLayout: layout)
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
    
    /*
     A UIButton at the bottom right corner of the screen
     - invokes menu editor on click
     */
    lazy var menuSettingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.themeColour
        button.tintColor = .white
        let image = UIImage(named: "gear")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(self.onSettingPressed), for: .touchUpInside)
        return button
    }()
    let slideOutMenuEditor = MenuEditor()

    override func viewDidLayoutSubviews() {
        slideOutMenuEditor.frame = view.bounds

    }
    
    @objc private func onSettingPressed() {
        slideOutMenuEditor.isMenuHidden = !slideOutMenuEditor.isMenuHidden
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        print(view.frame.width)
        // Do any additional setup after loading the view.
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.collectionViewBackgroundColour
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        view.addSubview(titleCollectionView)
        NSLayoutConstraint.activate([
            titleCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            titleCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            titleCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -44 ),
            titleCollectionView.heightAnchor.constraint(equalToConstant: titleCollectionView.preferredHeight)
            ])
        
        view.addSubview(menuCollectionView)
        NSLayoutConstraint.activate([
            menuCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            menuCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            menuCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            menuCollectionView.bottomAnchor.constraint(equalTo: titleCollectionView.topAnchor)])
        
        view.addSubview(menuSettingButton)
        NSLayoutConstraint.activate([
            menuSettingButton.leftAnchor.constraint(equalTo: titleCollectionView.rightAnchor),
            menuSettingButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            menuSettingButton.topAnchor.constraint(equalTo: titleCollectionView.topAnchor),
            menuSettingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
        view.addSubview(statusBarBackgroundView)
        view.addSubview(slideOutMenuEditor)
        addContainerView()
        
        

    }
    
    private func addContainerView() {
        let navController = SlideOutContainerNavigationViewController()
        let initalViewController = UIViewController()
        navController.viewControllers = [initalViewController]
        slideOutMenuEditor.addViewToContainer(navController.view)
        navController.didMove(toParent: self)
    }
}
