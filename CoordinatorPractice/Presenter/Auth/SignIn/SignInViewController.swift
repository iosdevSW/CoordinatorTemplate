//
//  SignInViewController.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/27.
//

import UIKit
import Combine

final class SignInViewController: BaseViewController {
    private let viewModel: SignInViewModel
    
    private let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal)
        
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("회원가입", for: .normal)
        
        return button
    }()
    
    init(viewModel: SignInViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        title = "로그인"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupBinding() {
        signInButton.tapPublisher
            .sink { [weak self] in
                self?.viewModel.coordinator?.finish()
                }.store(in: &cancellable)
        
        signUpButton.tapPublisher
            .sink { [weak self] in
                self?.viewModel.coordinator?.setAction(.signUp)
            }.store(in: &cancellable)
    }
    
    override func addSubViews() {
        [signInButton, signUpButton].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        signInButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
}
