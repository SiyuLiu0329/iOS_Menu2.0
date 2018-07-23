//
//  GenericItemView.swift
//  Menu2
//
//  Created by Siyu Liu on 9/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class GenericItemView: UIView {
    static var preferredWidth: CGFloat = 160
    
    static var preferredHeight: CGFloat {
        return preferredWidth * 1.2
    }
    
    static let hwRatio: CGFloat = 1
    
    static var imageViewHeight: CGFloat {
        return preferredHeight * 3/5
    }
    
    var margin: CGFloat = 10
    var labelHeight: CGFloat = 80
    
    static var nameLabelInset: CGFloat = 5
    
    var viewModel: GenericItemViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            itemImageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height - labelHeight)
            itemImageView.image = viewModel.image // default image
            nameLabel.frame = CGRect(x: margin, y: frame.height - labelHeight + margin, width: frame.width - 2 * margin, height: labelHeight - 2 * margin)
            nameLabel.text = viewModel.name
            nameLabel.sizeToFit()
        }
    }

    private var nameLabelFrameSplit: CGRect?
    
    
    var itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.natural
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(itemImageView)
        addSubview(nameLabel)
        backgroundColor = .white
        layer.cornerRadius = 5
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.themeColour.withAlphaComponent(0.4).cgColor
        clipsToBounds = true
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
