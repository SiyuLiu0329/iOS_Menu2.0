//
//  Transition.swift
//  Menu2
//
//  Created by Siyu Liu on 12/8/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class Transition: NSObject {
    
}

//
////
////  Transition.swift
////  Menu2
////
////  Created by Siyu Liu on 12/8/18.
////  Copyright © 2018 Siyu Liu. All rights reserved.
////
//
//import UIKit
//
//class Transition: NSObject {
//    var circle = UIView()
//    var startingPoint: CGPoint = CGPoint.zero {
//        didSet {
//            circle.center = startingPoint
//        }
//    }
//
//    var circleColour = UIColor.white
//    var duration = 0.3
//
//    enum CircularTransitionMode: Int {
//        case present, dismiss, pop
//    }
//
//    var transitionMode: CircularTransitionMode = .present
//}
//
//extension Transition: UIViewControllerAnimatedTransitioning {
//    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//        return duration
//    }
//
//    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//        let containerView = transitionContext.containerView
//        if transitionMode == .present {
//            if let presentedView = transitionContext.view(forKey: .to) {
//                let viewCenter = presentedView.center
//                let viewSize = presentedView.frame.size
//                circle = UIView()
//                circle.frame = frameForCircle(with: viewCenter, size: viewSize, startPoint: startingPoint)
//                circle.layer.cornerRadius = circle.frame.height / 2
//                circle.center = startingPoint
//                circle.backgroundColor = circleColour
//                containerView.addSubview(circle)
//                circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
//
//
//                presentedView.center = startingPoint
//                presentedView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
//                presentedView.alpha = 0
//                containerView.addSubview(presentedView)
//
//
//                UIView.animate(withDuration: duration, animations: {
//                    self.circle.transform = CGAffineTransform.identity
//
//                    presentedView.transform = CGAffineTransform.identity
//                    presentedView.alpha = 1
//                    presentedView.center = viewCenter
//                }) { (success: Bool) in
//                    transitionContext.completeTransition(success)
//                }
//
//
//
//            }
//        } else {
//            let transitionModeKey: UITransitionContextViewKey = (transitionMode == .pop) ? .to : .from
//            if let returningView = transitionContext.view(forKey: transitionModeKey) {
//                let viewCenter = returningView.center
//                let viewSize = returningView.frame.size
//                circle.frame = frameForCircle(with: viewCenter, size: viewSize, startPoint: startingPoint)
//                circle.layer.cornerRadius = circle.frame.height / 2
//                circle.center = startingPoint
//                UIView.animate(withDuration: duration, animations: {
//                    self.circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
//                    returningView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
//                    returningView.center = self.startingPoint
//                    returningView.alpha = 0
//
//                    if self.transitionMode == .pop {
//                        containerView.insertSubview(returningView, belowSubview: returningView)
//                        containerView.insertSubview(self.circle, belowSubview: returningView)
//
//
//                    }
//                }) { (success) in
//                    returningView.center = viewCenter
//                    returningView.removeFromSuperview()
//                    self.circle.removeFromSuperview()
//                    transitionContext.completeTransition(success)
//                }
//            }
//
//        }
//    }
//
//
//    func frameForCircle(with viewCenter: CGPoint, size: CGSize, startPoint: CGPoint) -> CGRect {
//        let xLength = fmax(startPoint.x, size.width - startPoint.x)
//        let yLength = fmax(startPoint.y, size.height - startPoint.y)
//        let offsetVector = sqrt(xLength * xLength + yLength * yLength) * 2
//        let size = CGSize(width: offsetVector, height: offsetVector)
//
//        return CGRect(origin: CGPoint.zero, size: size)
//    }
//}
//
