//
//  MenuViewController+Delegate.swift
//  Menu2
//
//  Created by Siyu Liu on 29/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit


extension MenuViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let visiblePageIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
        titleBar.selectedIndex = visiblePageIndex
    }
    
}

/*
 Take care of callbacks from the child collection view
 - edit button pressed
 - ...
 */
extension MenuViewController: MenuCollectionViewCellDelegate {
    // called when the edit button on each menu page is pressed

    func didPressEdit(cell: UICollectionViewCell) {
        if let indexPath = sectionCollectionView.indexPath(for: cell) {
            print(indexPath.row)
        }
    }
}
