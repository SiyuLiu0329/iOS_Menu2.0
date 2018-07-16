//
//  MenuCollectionViewCell+MenuItemDataSource.swift
//  Menu2
//
//  Created by Siyu Liu on 29/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

extension MenuCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsModel?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuItemCell.cellId, for: indexPath) as! MenuItemCell
        cell.item = itemsModel?.items[indexPath.row]
        return cell
    }
    
    
}
