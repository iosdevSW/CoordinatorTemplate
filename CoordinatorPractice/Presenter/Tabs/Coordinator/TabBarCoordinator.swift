//
//  TabBarCoordinator.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/27.
//

import UIKit

final class TabBarCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    lazy var tabBarController = MainTabBarController(coordinator: self)
    var navigationController: UINavigationController
    
    weak var delegate: CoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let items: [UINavigationController] = TabBarItem.allCases.map {
            createNavigationController(item: $0)
        }
        configureTabBarController(with: items)
    }
    
    func bindEvent() {
        
    }
}

private extension TabBarCoordinator {
    private func configureTabBarController(with tabViewControllers: [UIViewController]) {
        self.tabBarController.setViewControllers(tabViewControllers, animated: true)
        self.navigationController.setNavigationBarHidden(true, animated: false)
        self.navigationController.viewControllers = [tabBarController]
    }
    
    func createNavigationController(item: TabBarItem) -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.tabBarItem = item.item
        configureTabBarCoordinator(item: item, navigationController: navigationController)
        return navigationController
    }
    
    func configureTabBarCoordinator(item: TabBarItem, navigationController nc: UINavigationController) {
        switch item {
        case .home:
            let homeCoordinator = HomeCoordiantor(navigationController: nc)
            homeCoordinator.delegate = self
            homeCoordinator.start()
            childCoordinators.append(homeCoordinator)
        case .mypage:
            let mypageCoordinator = MyPageCoordinator(navigationController: nc)
            mypageCoordinator.delegate = self
            mypageCoordinator.start()
            childCoordinators.append(mypageCoordinator)
        }
    }
}

extension TabBarCoordinator: CoordinatorDelegate {
    func didFinish(childCoordinator: Coordinator) {
        navigationController.popViewController(animated: true)
        finish()
        childCoordinators = []
    }
}
