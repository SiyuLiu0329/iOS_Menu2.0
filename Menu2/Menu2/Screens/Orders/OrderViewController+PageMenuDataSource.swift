//
//  OrderViewController+PageMenuDataSource.swift
//  Menu2
//
//  Created by Siyu Liu on 21/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import Foundation
import UIKit

extension OrderViewController: PageMenuDataSource {
    func numberOfPages() -> Int {
        return 50
    }
    
    func numberOfItems(on page: Int) -> Int {
        return 10
    }
    
    func cell(for item: Int, on page: Int) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func nameOfTitle(for page: Int) -> String {
        return "title"
    }
    
}
