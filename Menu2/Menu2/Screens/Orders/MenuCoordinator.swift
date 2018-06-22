//
//  Coordinator.swift
//  Menu2
//
//  Created by Siyu Liu on 19/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import Foundation
import UIKit

class MenuCoordinator: BaseCoordinator {
    var childCoordinators: [BaseCoordinator] = []
    
    var parentCoordinator: BaseCoordinator?
    
    var presentor: Presentor & UIViewController
    
    func start() {
        if let presentor = presentor as? UINavigationController {
            let initialViewController = OrderViewController()
            initialViewController.coordinator = self
            presentor.pushViewController(initialViewController, animated: true)
        }
    }
    
    deinit {
        print(self, "deinited.")
    }
    
    init(presentor: Presentor & UIViewController, parent: BaseCoordinator?) {
        self.presentor = presentor
        self.parentCoordinator = parent
        self.presentor.coordinator = self
    }
    
    func createNewOrder() {
        if let presentor = presentor as? UINavigationController {
            presentor.pushViewController(UIViewController(), animated: true)
        }
    }
    
}
