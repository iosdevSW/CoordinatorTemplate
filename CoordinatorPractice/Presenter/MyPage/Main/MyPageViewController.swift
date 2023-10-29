//
//  MyPageViewController.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/28.
//

import UIKit
import Combine
import SnapKit

final class MyPageViewController: UIViewController {
    private var cancellabel = Set<AnyCancellable>()
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
        
        addSubViews()
        setLayout()
        setUpBinding()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpBinding() {
        logoutButton.tapPublisher
            .sink { [weak self] in
                self?.viewModel.coordinator?.finish()
                }.store(in: &cancellabel)
    }
    
    private func addSubViews() {
        view.addSubview(logoutButton)
    }
    
    private func setLayout() {
        logoutButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
