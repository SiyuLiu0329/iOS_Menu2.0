//
//  GenericItemViewWithInfo.swift
//  Menu2
//
//  Created by Siyu Liu on 13/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit
/*
 This view serves as a wrapper view around the item view (which only consists of an image and a label)
 This view adds additional labels at below the item view (ie the price label and the item number label)
 - Recommend using the preferred dimensions when setting up the frame
 */
class GenericItemViewWithInfo: UIView {
    var preferredHeight: CGFloat {
        // make space for item price label and item number label
        return itemView.preferredHeight + infoHeight
    }
    
    var preferredWidth: CGFloat {
        return itemView.preferredWidth
    }
    
    var infoHeight: CGFloat = 24
    
    var viewModel: GenericItemViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            let height = itemView.preferredHeight
            itemView.frame = CGRect(x: 0, y: 0, width: itemView.preferredWidth, height: height)
            itemIdLabel.frame = CGRect(x: 0, y: height, width: frame.width, height: frame.height - height)
            itemIdLabel.text = "randomId"
            itemView.viewModel = viewModel
        }
    }
    
    var itemIdLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    var itemView: GenericItemView = {
        let itemView = GenericItemView()
        return itemView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(itemView)
        addSubview(itemIdLabel)
//        backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
