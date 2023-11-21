//
//  HomeCoordiantor.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/27.
//

import UIKit

final class HomeCoordiantor: Coordinator {
 
    enum Action {
        case main, detail
    }
    
    var childCoordinators: [any Coordinator] = []
    var navigationController: UINavigationController
    weak var delegate: CoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        setAction(.main)
    }
    
    func setAction(_ action: Action) {
        switch action {
        case .main:
            let homeVM = HomeViewModel(coordinator: self)
            let homeVC = HomeViewController(viewModel: homeVM)
            navigationController.pushViewController(homeVC, animated: true)
        case .detail:
            // TODO: Move detail
            break
        }
    }
}
