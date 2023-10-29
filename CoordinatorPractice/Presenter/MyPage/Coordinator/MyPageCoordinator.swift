//
//  MyPageCoordinator.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/27.
//

import UIKit

final class MyPageCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    var delegate: CoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        pushMyPageMain()
    }
    
    func bindEvent() {
        
    }
    
    func pushMyPageMain() {
        let mypageVM = MyPageViewModel(coordinator: self)
        let mypageVC = MyPageViewController(viewModel: mypageVM)
        navigationController.pushViewController(mypageVC, animated: true)
    }
}
