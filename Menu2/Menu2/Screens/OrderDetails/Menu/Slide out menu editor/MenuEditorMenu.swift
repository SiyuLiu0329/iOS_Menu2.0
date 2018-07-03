//
//  MenuEditorMenu.swift
//  Menu2
//
//  Created by Siyu Liu on 3/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class MenuEditor: SlideOutMenu {
    override func addViewToContainer(_ view: UIView) {
        slideOutView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: slideOutView.topAnchor),
            view.leftAnchor.constraint(equalTo: slideOutView.leftAnchor),
            view.rightAnchor.constraint(equalTo: slideOutView.rightAnchor),
            view.bottomAnchor.constraint(equalTo: slideOutView.bottomAnchor)
            ])

    }
}
