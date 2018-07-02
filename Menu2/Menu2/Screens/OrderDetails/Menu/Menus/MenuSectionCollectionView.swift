//
//  OrderSectionCollectionView.swift
//  Menu2
//
//  Created by Siyu Liu on 27/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class MenuSectionCollectionView: UICollectionView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        backgroundColor = UIColor.collectionViewBackgroundColour
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


