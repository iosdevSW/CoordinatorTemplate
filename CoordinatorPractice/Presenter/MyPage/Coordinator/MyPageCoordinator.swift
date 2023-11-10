//
//  MyPageCoordinator.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/27.
//

import UIKit
import Combine

final class MyPageCoordinator: Coordinator {
    private var cancellable = Set<AnyCancellable>()
    
    enum CoordinatorEvent {
        case main, setting
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
        event.send(.main)
    }
    
    func bindEvent() {
        event.sink { [weak self] event in
            switch event {
            case .main:
                let mypageVM = MyPageViewModel(coordinator: self)
                let mypageVC = MyPageViewController(viewModel: mypageVM)
                self?.navigationController.viewControllers = [mypageVC]
            case .setting: break
            }
        }.store(in: &cancellable)
    }
}
