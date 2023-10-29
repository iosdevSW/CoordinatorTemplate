//
//  SplashViewController.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/27.
//

import UIKit

final class SplashViewController: UIViewController {
    private let viewModel: SplashViewModel
    
    init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.checkSignIn()
    }
}
