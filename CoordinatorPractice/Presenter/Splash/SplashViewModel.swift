//
//  SplashViewModel.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/27.
//

import Foundation

final class SplashViewModel {
    weak var coordinator: AppCoordinator?
    
    private var isLogin: Bool = true
    
    init(coordinator: AppCoordinator? = nil) {
        self.coordinator = coordinator
    }
    
    func checkSignIn() {
        
        isLogin.toggle()
        // localDB에 존재하는 AccessToken 유효성 검사 등 로그인 체크
        if isLogin {
            coordinator?.event.send(.tabBar)
        } else {
            coordinator?.event.send(.auth)
        }
    }
}
