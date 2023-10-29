//
//  UIButton+.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/29.
//

import UIKit.UIButton
import Combine

extension UIButton {
    var tapPublisher: AnyPublisher<Void, Never> {
        controlPublisher(for: .touchUpInside)
            .map { _ in }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
