//
//  MyPageViewController.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/26.
//

import UIKit

final class MyPageViewController: BaseViewController {
    
    // MARK: - properties
    
    private let baseView = MyPageView()
    
    // MARK: - life cycles
    
    override func loadView() {
        self.view = baseView
    }
    
    // MARK: - set
    
    override func setNavigationBar() {
        super.setNavigationBar()
        
        let backButton = BackButton()
        navigationItem.leftBarButtonItem = makeNavigationBarButton(with: backButton)
        navigationItem.rightBarButtonItem = makeNavigationBarButton(with: baseView.navigationBarButtonStack)
    }
    
    // MARK: - functions
    
    
    
    // MARK: - objc functions
    

}
