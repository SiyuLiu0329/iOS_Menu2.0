//
//  MenuCollectionViewCell+MenuItemDelegate.swift
//  Menu2
//
//  Created by Siyu Liu on 29/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

extension MenuCollectionViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // calculate the width based on how many items are in a row
        return CGSize(width: MenuItemCell.cellWidth, height: MenuItemCell.cellHeight)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = menuItemCollectionView.preferredInset
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
}
