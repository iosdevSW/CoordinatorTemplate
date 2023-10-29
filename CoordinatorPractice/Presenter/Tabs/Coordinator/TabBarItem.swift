//
//  TabBarItem.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/28.
//

import UIKit

enum TabBarItem: CaseIterable {
    case home, mypage
    
    var item: UITabBarItem {
        switch self {
        case .home:
            return .init(title: "홈",
                         image: .init(systemName: "house"),
                         selectedImage: .init(systemName: "house.fill"))
        case .mypage:
            return .init(title: "마이페이지",
                         image: .init(systemName: "gearshape"),
                         selectedImage: .init(systemName: "gearshape.fill"))
        }
    }
}
