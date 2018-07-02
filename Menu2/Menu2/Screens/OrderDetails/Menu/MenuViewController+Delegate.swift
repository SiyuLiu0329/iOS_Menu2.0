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
        if collectionView == sectionCollectionView {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        } else {
            guard let name = menuModel.menus[indexPath.row].name else { return CGSize.zero}
            return CGSize(width: CGFloat(name.count) * 15 + 20, height: collectionView.frame.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == sectionCollectionView {
            
        } else {
            // if this cell is already selected, do nothing
            guard indexPath.row != menuModel.selectedMenu else { return }
            let lastSelected = menuModel.selectedMenu
            menuModel.selectedMenu = indexPath.row
            collectionView.reloadItems(at: [indexPath, IndexPath(item: lastSelected, section: 0)])
            sectionCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard scrollView == sectionCollectionView else { return }
        let cellIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
        let indexPath = IndexPath(row: cellIndex, section: 0)
        titleCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        titleCollectionView.delegate?.collectionView!(titleCollectionView, didSelectItemAt: indexPath)
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
