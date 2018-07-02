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
    
    let statusBarBackgroundView: UIView = {
        let view = UIView()
        view.frame = UIApplication.shared.statusBarFrame
        view.backgroundColor = UIColor.themeColour
        return view
    }()
    
    lazy var titleCollectionView: MenuTitleCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = MenuTitleCollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MenuTitleCollectionViewCell.self, forCellWithReuseIdentifier: MenuTitleCollectionViewCell.cellId)
        return collectionView
    }()
    
    lazy var sectionCollectionView: MenuSectionCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let sectionView = MenuSectionCollectionView(frame: CGRect.zero, collectionViewLayout: layout)
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
    
    @objc private func onSettingPressed() {
        let menuEditorViewController = MenuEditorViewController()
        let navigationController = UINavigationController()
        navigationController.viewControllers = [menuEditorViewController]
        navigationController.modalPresentationStyle = .popover
        let popOver = navigationController.popoverPresentationController
        popOver?.sourceView = menuSettingButton
        present(navigationController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTopBar()
        // Do any additional setup after loading the view.
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.collectionViewBackgroundColour
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpTopBar() {
        view.addSubview(titleCollectionView)
        NSLayoutConstraint.activate([
            titleCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            titleCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            titleCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -44 ),
            titleCollectionView.heightAnchor.constraint(equalToConstant: titleCollectionView.preferredHeight)
            ])
        
        view.addSubview(sectionCollectionView)
        NSLayoutConstraint.activate([
            sectionCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            sectionCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            sectionCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            sectionCollectionView.bottomAnchor.constraint(equalTo: titleCollectionView.topAnchor)])
        
        view.addSubview(statusBarBackgroundView)

        view.addSubview(menuSettingButton)
        NSLayoutConstraint.activate([
            menuSettingButton.leftAnchor.constraint(equalTo: titleCollectionView.rightAnchor),
            menuSettingButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            menuSettingButton.topAnchor.constraint(equalTo: titleCollectionView.topAnchor),
            menuSettingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
}
