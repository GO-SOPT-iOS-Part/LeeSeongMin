//
//  MainViewController.swift
//  Third_Seminar
//
//  Created by 이성민 on 2023/04/22.
//

import UIKit

import SnapKit

final class MainViewController: BaseViewController {
    
    // MARK: - properties
    
    private let originView = MainView()
    
    // MARK: - life cycles
    
    override func loadView() {
        self.view = originView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
    }
    
    // MARK: - set
    
    override func setStyle() {
        
    }
    
    // MARK: - functions
    
    
    
    // MARK: - objc functions
    

}
