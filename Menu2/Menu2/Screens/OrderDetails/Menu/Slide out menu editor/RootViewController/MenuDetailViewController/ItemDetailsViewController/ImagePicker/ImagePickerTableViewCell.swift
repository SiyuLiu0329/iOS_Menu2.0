//
//  ImagePickerTableViewCell.swift
//  Menu2
//
//  Created by Siyu Liu on 11/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

protocol ImagePickerDelegate: class {
    func didChangeImage() // notify the parent view of change
    func didReqestCameraRollImage(sourceView: UIView)
}

class ImagePickerTableViewCell: UITableViewCell {
    static let cellId = "imagePicker"
    var itemEditorModel: ItemEditorModel?
    weak var imagePickerDelegate: ImagePickerDelegate?
    var images: [UIImage] = [
    ]
    
    lazy var imageCollectionView: ImageCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = ImageCollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.cellId)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    lazy var chooseImageButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.themeColour.withAlphaComponent(0.6), for: .normal)
        button.setTitleColor(UIColor.themeColour.withAlphaComponent(0.2), for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Camera Roll", for: .normal)
        button.addTarget(self, action: #selector(self.onCameraRollPressed), for: .touchUpInside)
        return button
    }()
    
    @objc private func onCameraRollPressed() {
        guard let delegate = imagePickerDelegate else { return }
        delegate.didReqestCameraRollImage(sourceView: chooseImageButton)
    }
    
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
        selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        contentView.addSubview(chooseImageButton)
        NSLayoutConstraint.activate([
            chooseImageButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            chooseImageButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            chooseImageButton.heightAnchor.constraint(equalToConstant: 20),
            chooseImageButton.widthAnchor.constraint(equalToConstant: 120)])
        
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.rightAnchor.constraint(equalTo: chooseImageButton.leftAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 24)])
        
        contentView.addSubview(imageCollectionView)
        NSLayoutConstraint.activate([
            imageCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            imageCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
        
        
    }
}
