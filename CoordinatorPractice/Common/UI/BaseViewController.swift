//
//  BaseViewController.swift
//  ZeneFit
//
//  Created by iOS신상우 on 2023/09/28.
//

import UIKit
import Combine

class BaseViewController: UIViewController {
    var cancellable = Set<AnyCancellable>()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setLayout()
        configureNavigation()
        configureUI()
        setupBinding()
        setGesture()
        setDelegate()
    }
    
    func configureUI() {
        self.view.backgroundColor = .white
        self.modalPresentationStyle = .fullScreen
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    func addSubViews() { }
    
    func setLayout() { }
    
    func configureNavigation() {
        self.navigationItem.hidesBackButton = true
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = .white
        navigationBarAppearance.shadowColor = .clear
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(named: "BackButton")?.withRenderingMode(.alwaysOriginal), for: .normal)
        backButton.addTarget(self, action: #selector(didClickBackButton), for: .touchUpInside)
        
        self.navigationItem.leftBarButtonItems = [.init(customView: backButton)]
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    func configureTabBar() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = .white
        tabBarController?.tabBar.standardAppearance = tabBarAppearance
        tabBarController?.tabBar.scrollEdgeAppearance = tabBarAppearance
    }
    
    @objc func didClickBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupBinding() { }
    
    func setGesture() { }
    
    func setDelegate() { }
}

extension BaseViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return navigationController?.viewControllers.count ?? 0 > 1
    }
}
