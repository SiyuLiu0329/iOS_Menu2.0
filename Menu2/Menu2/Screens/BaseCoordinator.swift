import Foundation
import UIKit

protocol BaseCoordinator: class {
    var childCoordinators: [BaseCoordinator] { get set }
    var parentCoordinator: BaseCoordinator? { get set }
    var presentor: Presentor & UIViewController { get set }
    func start()
}

extension BaseCoordinator {
    func done() {
        parentCoordinator?.removeChildCoordinator(child: self)
    }
    
    func removeChildCoordinator(child: BaseCoordinator) {
        childCoordinators = childCoordinators.filter({$0 !== child})
    }
    
    func addChildCoordinator(child: BaseCoordinator) {
        child.parentCoordinator = self
        childCoordinators.append(child)
    }
}

protocol Presentor: class {
    var coordinator: BaseCoordinator? { set get }
}
