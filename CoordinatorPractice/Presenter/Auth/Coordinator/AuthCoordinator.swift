//
//  AuthCoordinator.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/27.
//

import UIKit

final class AuthCoordinator: Coordinator {
    
    enum Action {
        case signIn
        case signUp
    }
    
    var childCoordinators: [ any Coordinator] = []
    var navigationController: UINavigationController
    weak var delegate: CoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        setAction(.signIn)
    }
    
    func setAction(_ action: Action) {
        switch action {
        case .signIn:
            let signInVM = SignInViewModel(coordinator: self)
            let signInVC = SignInViewController(viewModel: signInVM)
            navigationController.viewControllers = [signInVC]
        case .signUp:
            let signUpVM = SignUpViewModel(coordinator: self)
            let signUpVC = SignUpViewController(viewModel: signUpVM)
            navigationController.pushViewController(signUpVC, animated: true)
        }
    }
}
