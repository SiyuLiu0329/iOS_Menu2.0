//
//  GenericItemView.swift
//  Menu2
//
//  Created by Siyu Liu on 9/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class GenericItemView: UIView {
    static let requiredHeightAndWidth: CGFloat = 120
    let colourBarHeight: CGFloat = 10
    let imageViewHeight: CGFloat = 80
    var viewModel: GenericItemViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            if let image = viewModel.image {
                // split the view
                itemImageView.image = image
                itemImageView.frame = CGRect(x: 0, y: colourBarHeight, width: frame.width, height: imageViewHeight)
                nameLabel.frame = CGRect(x: 0, y: 80 + colourBarHeight, width: frame.width, height: frame.height - imageViewHeight - colourBarHeight)
            } else {
                // make the label take up the whole space
                nameLabel.frame = CGRect(x: 0, y: colourBarHeight, width: frame.width, height: frame.height - colourBarHeight)
                itemImageView.frame = CGRect.zero
            }
            nameLabel.text = viewModel.name
        }
    }
    
    override var frame: CGRect {
        didSet {
            layoutViews()
        }
    }
    
    private func layoutViews() {
        colourBar.frame = CGRect(x: 0, y: 0, width: frame.width, height: colourBarHeight)
    }

    private var nameLabelFrameSplit: CGRect?
    
    var itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(colourBar)
        addSubview(itemImageView)
        addSubview(nameLabel)
        backgroundColor = .white
        layer.cornerRadius = 5
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.themeColour.withAlphaComponent(0.4).cgColor
        clipsToBounds = true
    }
    
    var colourBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.themeColour
        return view
    }()

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
