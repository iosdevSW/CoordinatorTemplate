//
//  HomeCoordiantor.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/27.
//

import UIKit

final class HomeCoordiantor: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    var delegate: CoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        pushHomeMain()
    }
    
    func bindEvent() {
        
    }
    
    func pushHomeMain() {
        let homeVM = HomeViewModel(coordinator: self)
        let homeVC = HomeViewController(viewModel: homeVM)
        navigationController.pushViewController(homeVC, animated: true)
    }
}
