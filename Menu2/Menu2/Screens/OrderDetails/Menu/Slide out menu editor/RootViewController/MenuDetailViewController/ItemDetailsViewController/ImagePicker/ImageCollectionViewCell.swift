//
//  ImageCollectionViewCell.swift
//  Menu2
//
//  Created by Siyu Liu on 11/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    static let cellId = "imageCell"
    let pad: CGFloat = 8
    var image: UIImage? {
        didSet {
            guard let image = image else { return }
            imageView.frame = CGRect(x: pad, y: pad, width: contentView.frame.width - 2 * pad, height: contentView.frame.height - 2 * pad)
            imageView.image = image
        }
    }
    
    let imageView: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
