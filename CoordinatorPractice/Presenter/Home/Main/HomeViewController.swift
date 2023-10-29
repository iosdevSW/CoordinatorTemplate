//
//  HomeViewController.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/28.
//

import UIKit

final class HomeViewController: UIViewController {
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = "홈"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
