//
//  ImagePickerTableViewCell.swift
//  Menu2
//
//  Created by Siyu Liu on 11/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class ImagePickerTableViewCell: UITableViewCell {
    static let cellId = "imagePicker"
    
    lazy var imageCollectionView: ImageCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = ImageCollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Image"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = UIColor.themeColour
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 24)])
        
        contentView.addSubview(imageCollectionView)
        NSLayoutConstraint.activate([
            imageCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            imageCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
        
        
    }
}
