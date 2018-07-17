//
//  MenuDetailsTableViewCell.swift
//  Menu2
//
//  Created by Siyu Liu on 7/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class GenericItemTableViewCell: UITableViewCell {
    static let preferredCellHeight: CGFloat = 120
    static let cellId = "menuDetailsCell"
    
    // TODO place this in a view model later so this can be reused
    var viewModel: GenericItemTableViewCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            title.text = viewModel.title
            subtitle.text = viewModel.subTitle
            itemImageView.image = viewModel.image
            accessoryType = viewModel.acessoryType
            contentView.backgroundColor = viewModel.backgroundColor
            title.textColor = viewModel.textColor
            subtitle.textColor = viewModel.textColor
        }
    }
    
    var contentInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    var imageTextSpacing: CGFloat = 16
    var itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lorem Ispum"
//        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
    var subtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.text = "$99.99"
        label.textColor = UIColor.gray
        return label
    }()
    
    lazy var titleView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [title, subtitle])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillEqually
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        separatorInset =  UIEdgeInsets(top: 0, left: GenericItemTableViewCell.preferredCellHeight + imageTextSpacing, bottom: 0, right: 0)
        accessoryType = .disclosureIndicator
        setUpViews()
        setUpTitleView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        contentView.addSubview(itemImageView)
        NSLayoutConstraint.activate([
            itemImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: contentInset.left),
            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: contentInset.top
            ),
            itemImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -contentInset.bottom),
            itemImageView.widthAnchor.constraint(equalToConstant: GenericItemTableViewCell.preferredCellHeight -  contentInset.top - contentInset.bottom)])
        
    }
    
    private func setUpTitleView() {
        contentView.addSubview(titleView)
        titleView.backgroundColor = .red
        NSLayoutConstraint.activate([
            titleView.leftAnchor.constraint(equalTo: itemImageView.rightAnchor, constant: imageTextSpacing),
            titleView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -contentInset.right),
            titleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 35),
            titleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -35)
            ])
    }
    
    
    
}
