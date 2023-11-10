//
//  SignUpViewController.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/31.
//

import UIKit

final class SignUpViewController: BaseViewController {
    private let viewModel: SignUpViewModel
    
    private let completeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("회원가입 완료", for: .normal)
        
        return button
    }()
    
    init(viewModel: SignUpViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = "회원가입"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupBinding() {
        completeButton.tapPublisher
            .sink { [weak self] in
                self?.viewModel.coordinator?.popupViewController(animated: true)
                }.store(in: &cancellable)
    }
    
    override func addSubViews() {
        [completeButton].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        completeButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
