//
//  OrderCollectionViewCell.swift
//  Menu2
//
//  Created by Siyu Liu on 22/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

/*
 This is a collection view cell that is responsible for displaying all Order objects
 */
class OrderCollectionViewCell: UICollectionViewCell {
    let cellId = "cellId"
    let cellWidth: CGFloat = 150
    
    weak var delegate: OrderCellDalegate?
    var loadedSection: OrderSection? {
        didSet {
            guard let loadedSection = loadedSection else { return }
            sectionTitle.text = loadedSection.sectionName
            // load orders into this section
        }
    }
    
    lazy var longPressGestureRecogniser: UILongPressGestureRecognizer = {
        let gestureRecogniser = UILongPressGestureRecognizer(target: self, action: #selector(self.didLongPress(recogniser:)))
        return gestureRecogniser
    }()
    
    @objc private func didLongPress(recogniser: UILongPressGestureRecognizer) {
        let point = recogniser.location(in: orderSectionView)
        guard recogniser.state == .began else { return }
        guard let indexPath = orderSectionView.indexPathForItem(at: point) else { return }
        guard let delegate = delegate else { return }
        guard let cell = orderSectionView.cellForItem(at: indexPath) else { return }
        
        delegate.didLongPressOrder(in: loadedSection?.sectionName ?? "", at: indexPath.row, cell: cell)
        
    }
    
    /*
     This is a collection view with a collection view, orders are displayed in this collection view horizontally
     */
    lazy var orderSectionView: UICollectionView = {
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

    
    /*
     A horinzontal section divider
     */
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
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutSectionView()
        backgroundColor = .clear
        addGestureRecognizer(longPressGestureRecogniser)
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
