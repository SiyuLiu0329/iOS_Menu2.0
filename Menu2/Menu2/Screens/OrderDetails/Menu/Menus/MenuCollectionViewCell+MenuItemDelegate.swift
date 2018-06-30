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
        let gapWidth = CGFloat(menuItemCollectionView.preferredNumberOfItemsPerRow - 1) * (menuItemCollectionView.preferredInterItemSpacing)
        let insets = menuItemCollectionView.preferredInset * 2
        let width = (collectionView.frame.width - insets - gapWidth) / CGFloat(menuItemCollectionView.preferredNumberOfItemsPerRow)
        return CGSize(width: width, height: width)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = menuItemCollectionView.preferredInset
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    // fix up edge insets
}
