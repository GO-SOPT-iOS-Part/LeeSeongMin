//
//  LoginView.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/25.
//

import UIKit

import SnapKit

final class LoginView: BaseView {
    
    // MARK: - properties
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "TVING ID 로그인"
        label.textColor = .gray1
        label.font = .title
        label.textAlignment = .center
        return label
    }()
    
    let usernameTextField = CustomTextField(type: .username)
    
    let passwordTextField = CustomTextField(type: .password)
    
    let loginButton: CustomButton = {
        let button = CustomButton(status: .disabled, with: "로그인")
        button.isEnabled = false
        return button
    }()
    
    let findIDButton: UIButton = {
        let button = UIButton()
        button.setTitle("아이디 찾기", for: .normal)
        button.setTitleColor(.gray2, for: .normal)
        button.titleLabel?.font = UIFont.bold
        return button
    }()
    
    let findPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호 찾기", for: .normal)
        button.setTitleColor(.gray2, for: .normal)
        button.titleLabel?.font = UIFont.bold
        return button
    }()
    
    private let findViewDivider: UIView = {
        let view = UIView()
        view.backgroundColor = .gray4
        return view
    }()
    
    private let createAccountQuestionLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
        label.font = UIFont.regular
        label.textColor = .gray3
        return label
    }()
    
    let createAccountButton: UIButton = {
        let button = UIButton()
        let attributedText = NSAttributedString(
            string: "닉네임 만들러가기",
            attributes: [
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .underlineColor: UIColor.gray2,
                .font: UIFont.regular,
                .foregroundColor: UIColor.gray2
            ])
        button.frame = .init(x: 0, y: 0, width: 10, height: 10)
        button.setAttributedTitle(attributedText, for: .normal)
        return button
    }()
    
    // MARK: -  set
    
    override func setLayout() {
        addSubview(loginLabel)
        loginLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(30)
            $0.horizontalEdges.equalToSuperview()
        }
        
        addSubview(usernameTextField)
        usernameTextField.snp.makeConstraints {
            $0.top.equalTo(loginLabel.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(usernameTextField.snp.bottom).offset(10)
            $0.height.equalTo(52)
        }
        
        addSubview(loginButton)
        loginButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.height.equalTo(SizeLiteral.Button.height)
        }
        
        addSubview(findViewDivider)
        findViewDivider.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(12)
            $0.width.equalTo(1)
        }

        addSubview(findIDButton)
        findIDButton.snp.makeConstraints {
            $0.trailing.equalTo(findViewDivider.snp.leading).offset(-36)
            $0.centerY.equalTo(findViewDivider)
        }

        addSubview(findPasswordButton)
        findPasswordButton.snp.makeConstraints {
            $0.leading.equalTo(findViewDivider.snp.centerX).offset(36)
            $0.centerY.equalTo(findViewDivider)
        }
        
        addSubview(createAccountQuestionLabel)
        createAccountQuestionLabel.snp.makeConstraints {
            $0.top.equalTo(findViewDivider.snp.bottom).offset(40)
            $0.leading.equalToSuperview().inset(50)
        }
        
        addSubview(createAccountButton)
        createAccountButton.snp.makeConstraints {
            $0.centerY.equalTo(createAccountQuestionLabel)
            $0.trailing.equalToSuperview().inset(50)
        }
    }

}
