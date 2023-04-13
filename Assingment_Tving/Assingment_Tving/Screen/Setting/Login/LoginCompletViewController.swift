//
//  LoginCompletViewController.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/14.
//

import UIKit

import SnapKit

final class LoginCompletViewController: BaseViewController {
    
    // MARK: - properties
    
    private let mainPosterImageView = UIImageView(image: ImageLiteral.mainPoster)
    
    private let completeLabel: UILabel = {
        let label = UILabel()
        label.text = "님 반가워요"
        label.textColor = .white1
        label.font = UIFont.bold
        return label
    }()
    
    private let completeButton = CustomButton(status: .activated, with: "메인으로")
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
    // MARK: - functions
    
    // MARK: - objc functions
    
    // MARK: - setup
    
    override func setNavigationBar() {
        super.setNavigationBar()
        
        let backButton = BackButton()
        backButton.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        navigationItem.leftBarButtonItem = makeNavigationBarButton(with: backButton)
    }
    
    override func setLayout() {
        view.addSubview(mainPosterImageView)
        mainPosterImageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

