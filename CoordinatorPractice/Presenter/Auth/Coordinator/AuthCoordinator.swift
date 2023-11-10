//
//  AuthCoordinator.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/27.
//

import UIKit
import Combine

final class AuthCoordinator: Coordinator {
    
    enum CoordinatorEvent {
        case signIn
        case signUp
    }
    
    private var cancellabel = Set<AnyCancellable>()
    
    weak var delegate: CoordinatorDelegate?
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    var event = PassthroughSubject<CoordinatorEvent, Never>()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        bindEvent()
    }

    func start() {
        event.send(.signIn)
    }
    
    func bindEvent() {
        event.sink { [weak self] event in
            switch event {
            case .signIn:
                let signInVM = SignInViewModel(coordinator: self)
                let signInVC = SignInViewController(viewModel: signInVM)
                self?.navigationController.viewControllers = [signInVC]
            case .signUp:
                let signUpVM = SignUpViewModel(coordinator: self)
                let signUpVC = SignUpViewController(viewModel: signUpVM)
                self?.navigationController.pushViewController(signUpVC, animated: true)
            }
        }.store(in: &cancellabel)
    }
}
