//
//  MenuViewController+Delegate.swift
//  Menu2
//
//  Created by Siyu Liu on 29/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

extension MenuViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // check which collection view it is ( there are 2 collection views, one used to show menu items the other used to show titles at the bottom of the screen)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == menuCollectionView {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        } else {
            // dynamically allocate width based on the number of characters in the title
            guard let name = menuModel.menus[indexPath.row].name else { return CGSize.zero}
            return CGSize(width: CGFloat(name.count) * 8 + 25, height: collectionView.frame.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // check which collection view it is ( there are 2 collection views, one used to show menu items the other used to show titles at the bottom of the screen)
        if collectionView == menuCollectionView {
            
        } else {
            // if this cell is already selected, do nothing
            guard indexPath.row != menuModel.selectedMenu else { return }
            let lastSelected = menuModel.selectedMenu
            menuModel.selectedMenu = indexPath.row
            collectionView.reloadItems(at: [indexPath, IndexPath(item: lastSelected, section: 0)])
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            menuCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard scrollView == menuCollectionView else { return } // make sure the right collection view is calling this method
        let cellIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
        guard menuModel.selectedMenu != cellIndex else {return}
        let indexPath = IndexPath(row: cellIndex, section: 0)
        titleCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true) // scroll to the corresponding title
        let indexPathOld = IndexPath(item: menuModel.selectedMenu, section: 0)
        menuModel.selectedMenu = cellIndex
        titleCollectionView.reloadItems(at: [indexPath, indexPathOld])
    }
}

extension MenuViewController: MenuCollectionViewCellDelegate {
    func didSelectitem(_ item: Item, in cell: UICollectionViewCell) {
        zoomingViewSnapShot = cell.snapshotView(afterScreenUpdates: true)
        zoomingViewSnapShot?.center = cell.center
        showOptionsFor(item: item)
    } 
    
    private func showOptionsFor(item: Item) {
        // present a vc that allows user to select items
        // check if item has any associated options
        let vc = ItemOptionsViewController()
        vc.transitioningDelegate = self
//        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true, completion: nil)
        
        // TODO use a delegate function instead - didAddItem()...
//        guard let delegate = delegate else { return }
//        delegate.didAddItem(item: item)
    }
    
}



extension MenuViewController: MenuEditorDelegate {
    func didExitMenuEditor() {
        slideOutMenuEditor.isMenuHidden = true
    }
}


extension MenuViewController: SlideOutMenuDelegate {
    func SlideOutMenuStateDidChange(hidden: Bool) {
        // reload data here
        // TODO: make it more efficient (possibly by setting a flag)
        // TODO: show the correct page if the current page was deleted
        menuModel.loadMenus()
        titleCollectionView.reloadData()
        menuCollectionView.reloadData()
    }
}
