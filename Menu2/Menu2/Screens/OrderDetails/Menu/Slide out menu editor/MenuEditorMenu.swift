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
            view.bottomAnchor.constraint(equalTo: slideOutView.bottomAnchor, constant: -30)
            ])
        
        let  settingsButton = UIButton()
        settingsButton.setTitle("Hide", for: .normal)
        settingsButton.setTitleColor(UIColor.themeColour, for: .normal)
        slideOutView.addSubview(settingsButton)
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.imageView?.contentMode = .scaleAspectFit
        settingsButton.tintColor = UIColor.themeColour
        NSLayoutConstraint.activate([
            settingsButton.rightAnchor.constraint(equalTo: slideOutView.rightAnchor),
            settingsButton.widthAnchor.constraint(equalToConstant: 60),
            settingsButton.topAnchor.constraint(equalTo: view.bottomAnchor),
            settingsButton.bottomAnchor.constraint(equalTo: slideOutView.bottomAnchor)
            ])
        
        settingsButton.addTarget(self, action: #selector(self.onSettingsPressed), for: .touchUpInside)
    }
    
    @objc private func onSettingsPressed() {
        isMenuHidden = true
    }
    

}
