//
//  HomeViewController.swift
//  CoordinatorPractice
//
//  Created by iOS신상우 on 2023/10/28.
//

import UIKit
import CryptoKit
import CommonCrypto

final class HomeViewController: BaseViewController {
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = "홈"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
