//
//  SignUpViewModel.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/31.
//

import Foundation

final class SignUpViewModel {
    weak var coordinator: AuthCoordinator?
    
    init(coordinator: AuthCoordinator? = nil) {
        self.coordinator = coordinator
    }
}
