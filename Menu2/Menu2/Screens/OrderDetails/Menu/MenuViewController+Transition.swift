//
//  MenuViewController+Transition.swift
//  Menu2
//
//  Created by Siyu Liu on 12/8/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit
extension MenuViewController: ZoomingViewController {

    func zoomingView(for transition: ZoomTransitioningDelegate) -> UIView? {
        return zoomingViewSnapShot
    }
    
    func backgroundView(for transition: ZoomTransitioningDelegate) -> UIView? {
        return nil
    }
    
    func frameForContainerView(for transition: ZoomTransitioningDelegate) -> CGRect {
        
        return view.frame
    }
    
    func centerForZoomingView(for transition: ZoomTransitioningDelegate) -> CGPoint {
        guard let zoomingView = zoomingViewSnapShot else { return CGPoint.zero}
        let center = zoomingView.center
        return CGPoint(x: center.x, y: center.y + 70)
    }
    
    func sizeForView(for transition: ZoomTransitioningDelegate) -> CGSize {
        return CGSize(width: 450, height: 520)
    }
}

extension MenuViewController: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return transition
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return transition
    }
}
