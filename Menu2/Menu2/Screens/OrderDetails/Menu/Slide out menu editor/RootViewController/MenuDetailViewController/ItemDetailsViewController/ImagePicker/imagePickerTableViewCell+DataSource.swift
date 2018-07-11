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
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.cellId, for: indexPath) as! ImageCollectionViewCell
        cell.backgroundColor = .red
        return cell
    }
    
    
}
