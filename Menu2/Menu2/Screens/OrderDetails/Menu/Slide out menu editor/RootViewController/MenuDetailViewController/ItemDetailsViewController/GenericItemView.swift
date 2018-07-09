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
    var viewModel: GenericItemViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
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
    
    var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(colourBar)
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
