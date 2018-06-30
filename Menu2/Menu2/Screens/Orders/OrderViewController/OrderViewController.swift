//
//  OrderViewController.swift
//  Menu2
//
//  Created by Siyu Liu on 19/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    let cellId = "cellId"
    let section0Id = "section0cell"
    let preferredSectionHeight: CGFloat = 220
    let orderModel = OrderModel()
    
    lazy var horizontalCollectionView: HorizontalCollectionView = {
        let collectionView = HorizontalCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(OrderCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(Section0CollectionViewCell.self, forCellWithReuseIdentifier: section0Id)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    deinit {
        print(self, "deinited.")
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.backgroundColourMain
        setUpNavBar()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutViews() {
        view.addSubview(horizontalCollectionView)
        NSLayoutConstraint.activate([
            horizontalCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            horizontalCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            horizontalCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            horizontalCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    private func setUpNavBar() {
        navigationItem.title = "Orders"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(self.onCancelPressed))

    }
    
    @objc private func onCancelPressed() {
        dismiss(animated: true, completion: nil)
    }


}


