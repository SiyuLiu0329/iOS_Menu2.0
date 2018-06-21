//
//  PageMenuView.swift
//  Menu2
//
//  Created by Siyu Liu on 20/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

protocol PageMenuDelegate: class {
    
}

protocol PageMenuDataSource: class {
    func numberOfPages() -> Int
    func numberOfItems(on page: Int) -> Int
    func cell(for item: Int, on page: Int) -> UICollectionViewCell
    func nameOfTitle(for page: Int) -> String
}

class PageMenuRootView: UIView {
    weak var deleage: PageMenuDelegate?
    weak var dataSource: PageMenuDataSource? {
        didSet {
            pageView.pageDataSource = dataSource
            titleView.dataSource = dataSource
        }
    }
    
    private var titleView: PageMenuTitleView = {
        // titles at the top of the screen
        let view = PageMenuTitleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var pageView: PageMenuPageView = {
        // pages of items
        let view = PageMenuPageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutViews() {
        addSubview(titleView)
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: topAnchor),
            titleView.leftAnchor.constraint(equalTo: leftAnchor),
            titleView.rightAnchor.constraint(equalTo: rightAnchor),
            titleView.heightAnchor.constraint(equalToConstant: CGFloat(titleView.preferredHeight))
            ])
        
        addSubview(pageView)
        NSLayoutConstraint.activate([
            pageView.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            pageView.leftAnchor.constraint(equalTo: leftAnchor),
            pageView.rightAnchor.constraint(equalTo: rightAnchor),
            pageView.bottomAnchor.constraint(equalTo: bottomAnchor)])
    }
}
