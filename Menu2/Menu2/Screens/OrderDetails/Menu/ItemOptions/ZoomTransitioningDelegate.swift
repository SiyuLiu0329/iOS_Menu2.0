//
//  Transition.swift
//  Menu2
//
//  Created by Siyu Liu on 12/8/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

protocol ZoomingViewController: class {
    func zoomingView(for transition: ZoomTransitioningDelegate) -> UIView?
    func backgroundView(for transition: ZoomTransitioningDelegate) -> UIView?
    func frameForContainerView(for transition: ZoomTransitioningDelegate) -> CGRect
    func centerForZoomingView(for transition: ZoomTransitioningDelegate) -> CGPoint
    func sizeForFinalView(for transition: ZoomTransitioningDelegate) -> CGSize
    func coverViewForInitialView(for transition: ZoomTransitioningDelegate) -> UIView?
}

class ZoomTransitioningDelegate: NSObject {
    var tranistionDuration = 0.25
    weak var delegate: ZoomingViewController?
    
    enum Operation: Int {
        case none, present, pop
    }
    
    var operation: Operation = .none
    
    private let zoomScale: CGFloat = 15
    private let backgroundScale: CGFloat = 0.7
    
    var shadowView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()
    
    var initialFrame = CGRect.zero
    var finalFrame = CGRect.zero
    var zoomingView: UIView?
    var coverView: UIView?
    
    
}

extension ZoomTransitioningDelegate: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return tranistionDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let delegate = delegate else { return }
        let container = transitionContext.containerView
        if let destView = transitionContext.view(forKey: .to) {
            zoomingView = delegate.zoomingView(for: self)
            coverView = delegate.coverViewForInitialView(for: self)
            container.frame = delegate.frameForContainerView(for: self)
            zoomingView?.center = delegate.centerForZoomingView(for: self)
            let destViewSize = delegate.sizeForFinalView(for: self)
            
            container.addSubview(coverView!)
            container.addSubview(shadowView)
            container.addSubview(zoomingView!)
            container.addSubview(destView)
            shadowView.frame = container.bounds
            destView.alpha = 0
            destView.frame = zoomingView!.frame
            
            initialFrame = zoomingView!.frame
            finalFrame = CGRect(x: (container.frame.width / 2) - destViewSize.width / 2, y: (container.frame.height / 2) - destViewSize.height / 2, width: destViewSize.width, height: destViewSize.height)
            
            coverView?.frame = initialFrame
            UIView.animate(withDuration: tranistionDuration, delay: 0, options: .curveEaseInOut, animations: {
                destView.frame = self.finalFrame
                destView.alpha = 1
                
                self.zoomingView?.frame = destView.frame
                self.shadowView.alpha = 0.5
            }) { (success) in
                transitionContext.completeTransition(success)
            }
        }
        
        if let fromView = transitionContext.view(forKey: .from) {
            container.addSubview(fromView)
            zoomingView?.frame = finalFrame
            UIView.animate(withDuration: tranistionDuration, delay: 0, options: .curveEaseInOut, animations: {
                self.shadowView.alpha = 0
                self.zoomingView?.frame = self.initialFrame
                fromView.frame = self.initialFrame
                fromView.alpha = 0
            }) { (success) in
                self.shadowView.removeFromSuperview()
                self.zoomingView?.removeFromSuperview()
                self.coverView?.removeFromSuperview()
                transitionContext.completeTransition(success)
                
            }
        }
    }
    
    
}
