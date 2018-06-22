//
//  OrderCollectionViewCell+UICollectionViewDataSource.swift
//  Menu2
//
//  Created by Siyu Liu on 22/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//


import UIKit
extension OrderCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return loadedSection?.orders.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! OrderCell
        if let loadedSection = loadedSection {
            cell.loadOrder(from: loadedSection.orders[indexPath.row])
        }
        
        return cell
    }
}
