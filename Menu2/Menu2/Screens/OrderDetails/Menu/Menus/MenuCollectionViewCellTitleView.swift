//
//  MenuCollectionViewCellTitleView.swift
//  Menu2
//
//  Created by Siyu Liu on 2/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

/*
 Just a simple view holding a label so far.
 */
class MenuCollectionViewCellTitleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Unamed Menu"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor.themeColour
        return label
        
    }()
    
    private func setUpView() {
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)])
        
    }
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
}
