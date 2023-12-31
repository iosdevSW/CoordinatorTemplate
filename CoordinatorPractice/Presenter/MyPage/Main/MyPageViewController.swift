//
//  MyPageViewController.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/28.
//

import UIKit
import Combine
import SnapKit

final class MyPageViewController: BaseViewController {
    private let viewModel: MyPageViewModel
    
    private let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그아웃", for: .normal)
        
        return button
    }()
    
    init(viewModel: MyPageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = "마이페이지"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupBinding() {
        logoutButton.tapPublisher
            .sink { [weak self] in
                self?.viewModel.coordinator?.finish()
                }.store(in: &cancellable)
    }
    
    override func addSubViews() {
        view.addSubview(logoutButton)
    }
    
    override func setLayout() {
        logoutButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
