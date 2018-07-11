//
//  ImagePickerTableViewCell+Delegate.swift
//  Menu2
//
//  Created by Siyu Liu on 11/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

extension ImagePickerTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}
