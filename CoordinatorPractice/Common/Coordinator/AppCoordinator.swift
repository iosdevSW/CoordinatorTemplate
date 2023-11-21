//
//  AppCoordinator.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/27.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    enum Action {
      case auth
      case tabBar
    }
    
    var childCoordinators: [any Coordinator] = []
    var navigationController: UINavigationController
    var delegate: CoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let splashVM = SplashViewModel(coordinator: self)
        let splashVC = SplashViewController(
            viewModel: splashVM
        )

        navigationController.setViewControllers([splashVC], animated: false)
    }
    
    func setAction(_ action: Action) {
        switch action {
        case .auth:
            let authCoordinator = AuthCoordinator(navigationController: navigationController)
            authCoordinator.delegate = self
            authCoordinator.start()
            childCoordinators.append(authCoordinator)
        case .tabBar:
            let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
            tabBarCoordinator.delegate = self
            tabBarCoordinator.start()
            childCoordinators.append(tabBarCoordinator)
        }
    }
}

extension AppCoordinator: CoordinatorDelegate {
    func didFinish(childCoordinator: any Coordinator) {
        self.childCoordinators = []
        navigationController.presentedViewController?.dismiss(animated: false)
        
        if childCoordinator is AuthCoordinator {
            setAction(.tabBar)
        } else {
            setAction(.auth)
        }
    }
}

