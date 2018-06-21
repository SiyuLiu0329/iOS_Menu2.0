//
//  OrderCollectionViewCell+UICollectionViewDelegate.swift
//  Menu2
//
//  Created by Siyu Liu on 22/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

extension OrderCollectionViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth , height: frame.height - 25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
    }
    
}
