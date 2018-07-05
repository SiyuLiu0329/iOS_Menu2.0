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
    var blackIntensity: CGFloat = 1
    var isMenuHidden: Bool = true {
        
        willSet {
            UIView.animate(withDuration: animationDuration) {
                self.blurView.alpha = newValue ? 0 : self.blackIntensity
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
    let blurView: UIView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))

    
    @objc private func onBlackViewTapped() {
        isMenuHidden = true // hide menu when the black space is clicked
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        backgroundColor = .clear
        isUserInteractionEnabled = false
        addSubview(blurView)
        addSubview(slideOutView)
        
    }
    
    func addViewToContainer(_ view: UIView) {
        // need to call didMoveTo(parent) outside this function
        slideOutView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: slideOutView.topAnchor),
            view.leftAnchor.constraint(equalTo: slideOutView.leftAnchor),
            view.rightAnchor.constraint(equalTo: slideOutView.rightAnchor),
            view.bottomAnchor.constraint(equalTo: slideOutView.bottomAnchor)
            ])
    }
    
    
    private var frameHidden: CGRect?
    private var frameShown: CGRect?
    
    override var frame: CGRect {
        didSet {
            setUpFrames()
            setUpBlurView()
            setUpSlideOutView()
        }
    }
    
    /*
     Compute the frames for sliding animation
     */
    private func setUpFrames() {
        let x: CGFloat = frame.width - menuWitdh
        frameShown = CGRect(x: x, y: 0, width: menuWitdh, height: self.frame.height)
        frameHidden = CGRect(x: frame.width + 10, y: 0, width: menuWitdh, height: self.frame.height)
    }
    
    private func setUpBlurView() {
        blurView.frame = frame
//        blackView.backgroundColor = UIColor.themeColour
        blurView.alpha = 0
        
        let gestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(self.onBlackViewTapped))
        blurView.addGestureRecognizer(gestureRecogniser)
    }
    
    private func setUpSlideOutView() {
        slideOutView.backgroundColor = UIColor.collectionViewBackgroundColour
        slideOutView.addDropShadow(offset: CGSize(width: -1.5, height: 1), radius: 2, opacity: 0.6)
        if let frame = frameHidden {
            slideOutView.frame = frame
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
