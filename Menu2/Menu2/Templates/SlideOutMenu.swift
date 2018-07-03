//
//  SlideOutMenuEditor.swift
//  Menu2
//
//  Created by Siyu Liu on 3/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

/*
 A simple self contained slidout menu designed to be resued by subclassing
 */
class SlideOutMenu: UIView {
    var animationDuration = 0.3
    var menuWitdh: CGFloat = 320
    var blackIntensity: CGFloat = 0.20
    var isMenuHidden: Bool = true {
        
        willSet {
            UIView.animate(withDuration: animationDuration) {
                self.blackView.alpha = newValue ? 0 : self.blackIntensity
                if let hidden = self.frameHidden, let shown = self.frameShown {
                    self.slideOutView.frame = newValue ? hidden : shown
                }
            }
            // make user-interactable when the slide out menu is shown
            // make non-user-interactable when the slide out menu is hidden (so this view will not intercept touch events)
            isUserInteractionEnabled = !newValue
        }
    }
    
    let slideOutView = UIView()
    let blackView: UIView = UIView()
//        let view = UIView(frame: frame)
//        view.alpha = 0
//        let recogniser = UITapGestureRecognizer(target: self, action: #selector(self.onBlackViewTapped))
//        view.addGestureRecognizer(recogniser)
//        return view
//    }()
    
    @objc private func onBlackViewTapped() {
        isMenuHidden = true // hide menu when the black space is clicked
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        backgroundColor = .clear
        isUserInteractionEnabled = false
        addSubview(blackView)
        addSubview(slideOutView)
        
    }
    
    private var frameHidden: CGRect?
    private var frameShown: CGRect?
    
    override var frame: CGRect {
        didSet {
            setUpFrames()
            setUpBlackView()
            setUpSlideOutView()

        }
    }
    
    private func setUpFrames() {
        let x: CGFloat = frame.width - menuWitdh
        frameShown = CGRect(x: x, y: 0, width: menuWitdh, height: self.frame.height)
        frameHidden = CGRect(x: frame.width + 10, y: 0, width: menuWitdh, height: self.frame.height)
    }
    
    private func setUpBlackView() {
        blackView.frame = frame
        blackView.backgroundColor = UIColor.themeColour
        blackView.alpha = 0
        let gestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(self.onBlackViewTapped))
        blackView.addGestureRecognizer(gestureRecogniser)
    }
    
    private func setUpSlideOutView() {
        slideOutView.backgroundColor = UIColor.themeColour
        slideOutView.addDropShadow()
        if let frame = frameHidden {
            slideOutView.frame = frame
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
