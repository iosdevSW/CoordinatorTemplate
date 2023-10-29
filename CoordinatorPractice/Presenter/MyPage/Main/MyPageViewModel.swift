//
//  MyPageViewModel.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/28.
//

import Foundation

final class MyPageViewModel {
    weak var coordinator: MyPageCoordinator?
    
    init(coordinator: MyPageCoordinator? = nil) {
        self.coordinator = coordinator
    }
}
