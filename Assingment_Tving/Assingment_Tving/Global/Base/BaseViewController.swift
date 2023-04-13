//
//  BaseViewController.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/12.
//

import UIKit

import SnapKit

class BaseViewController: UIViewController {
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setLayout()
        setStyle()
    }
    
    // MARK: - setup functions
    
    func setNavigationBar() {
        guard let navigationBar = navigationController?.navigationBar else { return }
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .black1
        
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }
    
    func setLayout() {
        // override to use
    }
    
    func setStyle() {
        view.backgroundColor = .black1
    }
    
    // MARK: - objc functions
}
