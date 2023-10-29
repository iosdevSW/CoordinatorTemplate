//
//  SignInViewController.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/27.
//

import UIKit
import Combine

final class SignInViewController: UIViewController {
    private var cancellabel = Set<AnyCancellable>()
    private let viewModel: SignInViewModel
    
    private let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal)
        
        return button
    }()
    
    init(viewModel: SignInViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        title = "로그인"
        addSubViews()
        setLayout()
        setUpBinding()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpBinding() {
        signInButton.tapPublisher
            .sink { [weak self] in
                self?.viewModel.coordinator?.finish()
                }.store(in: &cancellabel)
    }
    
    private func addSubViews() {
        view.addSubview(signInButton)
    }
    
    private func setLayout() {
        signInButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
