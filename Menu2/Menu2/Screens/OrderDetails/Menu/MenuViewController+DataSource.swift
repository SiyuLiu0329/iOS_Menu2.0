//
//  MenuViewController+delegates.swift
//  Menu2
//
//  Created by Siyu Liu on 29/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

extension MenuViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuModel.numberOfMenus
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // check which collection view it is ( there are 2 collection views, one used to show menu items the other used to show titles at the bottom of the screen)
        if collectionView == menuCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.cellId, for: indexPath) as! MenuCollectionViewCell
            cell.menu = menuModel.menus[indexPath.row]
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuTitleCollectionViewCell.cellId, for: indexPath) as! MenuTitleCollectionViewCell
            cell.label.text = menuModel.menus[indexPath.row].name ?? "Unamed Menu"
            cell.titleSelected = menuModel.selectedMenu == indexPath.row
            return cell
        }
    }
    
    
}
