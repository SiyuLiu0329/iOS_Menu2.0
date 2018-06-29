//
//  OrderSectionCollectionView+Delegate.swift
//  Menu2
//
//  Created by Siyu Liu on 29/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

extension OrderSectionCollectionView: PageMenuTitlesDelegate {
    func didSelectTitle(at index: Int) {
        // scroll to ...
        scrollToItem(at: IndexPath(item: index, section: 0), at: .left, animated: true)
    }
}
