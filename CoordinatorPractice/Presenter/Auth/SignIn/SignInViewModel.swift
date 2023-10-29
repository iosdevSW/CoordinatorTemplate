//
//  SignInViewModel.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/27.
//

import Foundation

final class SignInViewModel {
    weak var coordinator: AuthCoordinator?
    
    init(coordinator: AuthCoordinator? = nil) {
        self.coordinator = coordinator
    }
}
