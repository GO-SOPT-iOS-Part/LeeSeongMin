//
//  MainViewController.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/26.
//

import UIKit

final class MainViewController: BaseViewController {
    
    // MARK: - properties
    
    private let baseView = MainView()
    
    // MARK: - life cycles
    
    override func loadView() {
        self.view = baseView
    }
    
    // MARK: - set
    
    override func setButtonTarget() {
        baseView.myPageButton.addTarget(self, action: #selector(myPageButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - functions
    
    
    
    // MARK: - objc functions
    
    @objc
    private func myPageButtonTapped() {
        let viewController = MyPageViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}
