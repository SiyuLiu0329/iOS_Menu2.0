//
//  PageMenuPageView.swift
//  Menu2
//
//  Created by Siyu Liu on 20/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class PageMenuPageView: UICollectionView {
    weak var pageDataSource: PageMenuDataSource?
    init() {
        let layout = UICollectionViewLayout()
        super.init(frame: CGRect.zero, collectionViewLayout: layout)
        backgroundColor = .blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
