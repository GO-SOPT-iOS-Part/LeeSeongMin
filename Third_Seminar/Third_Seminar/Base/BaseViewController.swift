//
//  BaseViewController.swift
//  Third_Seminar
//
//  Created by 이성민 on 2023/04/22.
//

import UIKit

import SnapKit

class BaseViewController: UIViewController {
    
    // MARK: - properties
    
    lazy private(set) var className: String = {
        return type(of: self).description().components(separatedBy: ".").last ?? ""
    }()
    
    // MARK: - init
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("DEINIT: \(className)")
    }
    
    // MARK: - life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - set
    
    func setStyle() {
        
        view.backgroundColor = .red
    }
    
    func setLayout() {}
    
    // MARK: - functions
    
    
    
    // MARK: - objc functions
    
}
