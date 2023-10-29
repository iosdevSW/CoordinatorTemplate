//
//  Coordinator.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/27.
//

import UIKit
import Combine

protocol CoordinatorDelegate: AnyObject {
    func didFinish(childCoordinator: Coordinator)
}

protocol Coordinator: AnyObject {

    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    var delegate: CoordinatorDelegate? { get set }
    
    // MARK: - start Coordinator
    func start()
    func bindEvent()
    func finish()
}

extension Coordinator {
    func finish() {
        childCoordinators.removeAll()
        delegate?.didFinish(childCoordinator: self)
    }
}
