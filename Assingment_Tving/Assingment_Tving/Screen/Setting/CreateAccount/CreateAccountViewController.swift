//
//  CreateAccountViewController.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/14.
//

import UIKit

import SnapKit

final class CreateAccountViewController: BaseViewController {
    
    // MARK: - properties
    
    private let setUsernameLabel: UILabel = {
        let label = UILabel()
        label.text = "닉네임을 입력해주세요"
        label.font = .title
        label.textColor = .gray1
        return label
    }()
    
    private let usernameTextField = CustomTextField(type: .username)
    
    // MARK: - life cycle
    
    
    // MARK: - functions
    
    
    // MARK: - objc functions
    
    
    // MARK: - setup
    
    override func setLayout() {
        view.addSubview(setUsernameLabel)
        setUsernameLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        view.addSubview(usernameTextField)
        usernameTextField.snp.makeConstraints {
            $0.top.equalTo(setUsernameLabel.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
}
