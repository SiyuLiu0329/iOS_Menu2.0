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
    
    lazy var titleBar: PageMenuTitles = {
        let topBarView = PageMenuTitles()
        topBarView.translatesAutoresizingMaskIntoConstraints = false
        return topBarView
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
        titleBar.titleDelegate = sectionCollectionView
        view.backgroundColor = UIColor.collectionViewBackgroundColour
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpTopBar() {
        titleBar.titles = menuModel.getMenuTitles()
        view.addSubview(titleBar)
        view.bringSubviewToFront(titleBar)
        NSLayoutConstraint.activate([
            titleBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            titleBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            titleBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -44 ),
            titleBar.heightAnchor.constraint(equalToConstant: titleBar.preferredHeight)
            ])
        
        view.addSubview(sectionCollectionView)
        NSLayoutConstraint.activate([
            sectionCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            sectionCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            sectionCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            sectionCollectionView.bottomAnchor.constraint(equalTo: titleBar.topAnchor)])
        
        view.addSubview(statusBarBackgroundView)

        view.addSubview(menuSettingButton)
        NSLayoutConstraint.activate([
            menuSettingButton.leftAnchor.constraint(equalTo: titleBar.rightAnchor),
            menuSettingButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            menuSettingButton.topAnchor.constraint(equalTo: titleBar.topAnchor),
            menuSettingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
}
