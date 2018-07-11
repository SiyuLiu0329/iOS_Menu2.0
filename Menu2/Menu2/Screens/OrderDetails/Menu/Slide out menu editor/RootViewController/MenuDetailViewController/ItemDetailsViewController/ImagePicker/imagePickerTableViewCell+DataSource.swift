//
//  imagePickerTableViewCell+DataSource.swift
//  Menu2
//
//  Created by Siyu Liu on 11/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

extension ImagePickerTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemEditorModel?.imagesForItem.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.cellId, for: indexPath) as! ImageCollectionViewCell
        cell.image = itemEditorModel?.imagesForItem[indexPath.row]
        return cell
    }
    
    
}
