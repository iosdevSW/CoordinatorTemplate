//
//  HomeViewModel.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/28.
//

import Foundation

final class HomeViewModel {
    weak var coordinator: HomeCoordiantor?
    
    init(coordinator: HomeCoordiantor) {
        self.coordinator = coordinator
    }
}
