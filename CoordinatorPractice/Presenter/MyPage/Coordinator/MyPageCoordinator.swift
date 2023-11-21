//
//  MyPageCoordinator.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/27.
//

import UIKit
import Combine

final class MyPageCoordinator: Coordinator {
    enum Action {
        case main, setting
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
            let mypageVM = MyPageViewModel(coordinator: self)
            let mypageVC = MyPageViewController(viewModel: mypageVM)
            navigationController.viewControllers = [mypageVC]
        case .setting: 
            // TODO: Move setting
            break
        }
    }
}
