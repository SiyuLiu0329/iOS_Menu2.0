//
//  PageMenuTitleView.swift
//  Menu2
//
//  Created by Siyu Liu on 20/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class PageMenuTitleView: UIScrollView {
    weak var dataSource: PageMenuDataSource? {
        didSet {
            // update the view as soon as the data source is set
            updateTitles()
        }
    }
    
    private var titles = [UILabel]()
    private let buttonWidth: CGFloat = 120
    let preferredHeight: CGFloat = 60
    var selectedIndex: Int?
    
    
    func updateTitles() {
        if !titles.isEmpty {
            titles.removeAll()
        }
        
        guard let dataSource = dataSource else { fatalError("Data source not set") }
        let nPages = dataSource.numberOfPages()
        contentSize = CGSize(width: CGFloat(nPages + 1) * buttonWidth, height: preferredHeight)
        alwaysBounceHorizontal = true
        (0..<nPages).forEach({self.createBotton(with: dataSource.nameOfTitle(for: $0), at: $0)})
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        showsHorizontalScrollIndicator =  false
        // try to only use 1 gesture recogniser for all the items
        let tapGuestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(self.tapped(recogniser:)))
        addGestureRecognizer(tapGuestureRecogniser)
        
    }
    
    @objc private func tapped(recogniser: UITapGestureRecognizer) {
        let tappedLocation = recogniser.location(in: self)
        if let itemIndex = indexOfItem(at: tappedLocation) {
            // item found
            didSelectItem(at: itemIndex)
        }
    }
    
    private func indexOfItem(at location: CGPoint) -> Int? {
        // returns the index of the title tapped
        let tappedIndex = Int(location.x / buttonWidth)
        if let dataSource = dataSource {
            if tappedIndex < dataSource.numberOfPages() {
                // should not have item 51 where there is only 50 items (out of bound)
                return tappedIndex
            }
        }
        return nil
    }
    
    private func didSelectItem(at index: Int) {
        let tappedTitle = titles[index]
        
        if let lastSelectedIndex = selectedIndex {
            // an item is already selected ... deselect it
            let titleToDeselect = titles[lastSelectedIndex]
            titleToDeselect.alpha = 0.5
        }
        
        selectedIndex = index
        tappedTitle.alpha = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createBotton(with text: String, at position: Int) {
        let title = UILabel()
        titles.append(title)
        title.text = "\(position)"
        title.textAlignment = .center
        title.frame = CGRect(x: CGFloat(position) * buttonWidth, y: 0, width: buttonWidth, height: preferredHeight)
        addSubview(title)
        title.alpha = 0.5
        title.backgroundColor = .green
    }
    
    
}
