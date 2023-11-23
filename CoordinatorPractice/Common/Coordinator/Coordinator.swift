//
//  Coordinator.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/27.
//

import UIKit

protocol CoordinatorDelegate: AnyObject {
    func didFinish(childCoordinator: any Coordinator)
}

protocol Coordinator: AnyObject {
    
    associatedtype Action
    
    var childCoordinators: [any Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    var delegate: CoordinatorDelegate? { get set }
    
    func start()
    func setAction(_ action: Action)
    func finish()
}

extension Coordinator {
    func finish() {
        childCoordinators.removeAll()
        delegate?.didFinish(childCoordinator: self)
    }
    
    func dismiss(animated: Bool = false) {
        navigationController.presentedViewController?.dismiss(animated: animated)
    }
    
    func popupViewController(animated: Bool = false) {
        navigationController.popViewController(animated: animated)
    }
}
