//
//  AppCoordinator.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/27.
//

import UIKit
import Combine

final class AppCoordinator: Coordinator {
    private var cancellable = Set<AnyCancellable>()
    
    enum CoordinatorEvent {
      case auth
      case tabBar
    }
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var delegate: CoordinatorDelegate?
    
    var event = PassthroughSubject<CoordinatorEvent, Never>()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        bindEvent()
    }
    
    func start() {
        let splashVM = SplashViewModel(coordinator: self)
        let splashVC = SplashViewController(
            viewModel: splashVM
        )
        navigationController.setViewControllers([splashVC], animated: true)
    }
    
    func bindEvent() {
        event.sink { [weak self] event in
            guard let self else { return }
            switch event {
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
                break
            }
        }.store(in: &cancellable)
    }
}

extension AppCoordinator: CoordinatorDelegate {
    func didFinish(childCoordinator: Coordinator) {
        navigationController.popViewController(animated: true)
        
        if childCoordinator is AuthCoordinator {
            event.send(.tabBar)
        } else {
            event.send(.auth)
        }
    }
}

