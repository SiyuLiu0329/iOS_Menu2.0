//
//  GenericItemView.swift
//  Menu2
//
//  Created by Siyu Liu on 9/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class GenericItemView: UIView {
    static let preferredWidth: CGFloat = 160
    static let prefferedAspectRatio: CGFloat = 1.2
    let imageViewHeight: CGFloat = 120
    var nameLabelInset: CGFloat = 5
    var viewModel: GenericItemViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            if let image = viewModel.image {
                // split the view
                itemImageView.image = image
                itemImageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: imageViewHeight)
                nameLabel.frame = CGRect(x: nameLabelInset, y: imageViewHeight + nameLabelInset, width: frame.width - 2 * nameLabelInset, height: frame.height - imageViewHeight - 2 * nameLabelInset)
            } else {
                // make the label take up the whole space
                nameLabel.frame = CGRect(x: nameLabelInset, y: nameLabelInset, width: frame.width -  2 * nameLabelInset, height: frame.height - 2 * nameLabelInset)
                itemImageView.frame = CGRect.zero
            }
            nameLabel.text = viewModel.name
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
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        label.numberOfLines = 0
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
