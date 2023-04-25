//
//  LoginCompleteViewController.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/14.
//

import UIKit

import SnapKit

final class LoginCompleteViewController: BaseViewController {
    
    // MARK: - properties
    
    private let mainPosterImageView = UIImageView(image: ImageLiteral.mainPoster)
    
    private let completeLabel: UILabel = {
        let label = UILabel()
        label.text = "님\n반가워요"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .white1
        label.font = UIFont.title
        return label
    }()
    
    private lazy var completeButton: CustomButton = {
        let button = CustomButton(status: .activated, with: "메인으로")
        button.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        return button
    }()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
    // MARK: - functions
    
    func bindId(_ id: String) {
        print(id)
        completeLabel.text = id + "님\n반가워요"
    }
    
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
        
        view.addSubview(completeLabel)
        completeLabel.snp.makeConstraints {
            $0.top.equalTo(mainPosterImageView.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
        }
        
        view.addSubview(completeButton)
        completeButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
    
}

