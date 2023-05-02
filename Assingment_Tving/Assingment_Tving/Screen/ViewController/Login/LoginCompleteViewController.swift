//
//  LoginCompleteViewController.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/14.
//

import UIKit

final class LoginCompleteViewController: BaseViewController {
    
    // MARK: - properties
    
    private let baseView = LoginCompleteView()
    
    // MARK: - life cycle
    
    override func loadView() {
        self.view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
    }
    
    // MARK: - set
    
    override func setNavigationBar() {
        super.setNavigationBar()
        
        let backButton = BackButton()
        backButton.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        navigationItem.leftBarButtonItem = makeNavigationBarButton(with: backButton)
    }
    
    override func setButtonTarget() {
        baseView.completeButton.addTarget(self, action: #selector(completeButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - functions
    
    func bindId(_ id: String) {
        print(id)
        baseView.completeLabel.text = id + "님\n반가워요"
    }
    
    // MARK: - objc functions
    
    @objc
    private func completeButtonTapped() {
        let viewController = HomeViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

