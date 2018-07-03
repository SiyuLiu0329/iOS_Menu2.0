//
//  MenuTitleCollectionViewCell.swift
//  Menu2
//
//  Created by Siyu Liu on 2/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class MenuTitleCollectionViewCell: UICollectionViewCell {
    static let cellId = "menuTitleCell"
    var titleSelected: Bool = false {
        willSet {
            label.backgroundColor = newValue ? UIColor.collectionViewBackgroundColour : UIColor.themeColour
            label.textColor = newValue ? UIColor.themeColour : UIColor.collectionViewBackgroundColour
        }
    }
    
    var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.themeColour
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leftAnchor.constraint(equalTo: leftAnchor),
            label.rightAnchor.constraint(equalTo: rightAnchor)])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
