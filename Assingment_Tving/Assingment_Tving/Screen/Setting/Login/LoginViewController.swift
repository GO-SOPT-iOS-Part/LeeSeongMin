//
//  LoginViewController.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/12.
//

import UIKit

import SnapKit

final class LoginViewController: BaseViewController {
    
    // MARK: - properties
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "TVING ID 로그인"
        label.textColor = .gray1
        label.font = .title
        label.textAlignment = .center
        return label
    }()
    
    private let usernameTextField = CustomTextField(type: .username)
    
    private let passwordTextField = CustomTextField(type: .password)
    
    private let loginButton = CustomButton(status: .disabled, with: "로그인")
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setKeyboard()
    }
    
    // MARK: - functions
    
    
    // MARK: - objc functions
    
    
    // MARK: - setup
    
    override func setNavigationBar() {
        super.setNavigationBar()
        
        let backButton = UIButton()
        backButton.setImage(ImageLiteral.navigationBack, for: .normal)
        navigationItem.leftBarButtonItem = makeNavigationBarButton(with: backButton)
    }
    
    override func setLayout() {
        view.addSubview(loginLabel)
        loginLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        view.addSubview(usernameTextField)
        usernameTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(loginLabel.snp.bottom).offset(30)
            $0.height.equalTo(52)
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(usernameTextField.snp.bottom).offset(10)
            $0.height.equalTo(52)
        }
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.height.equalTo(52)
        }
    }
    
    private func setDelegate() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
}


// MARK: - textfield delegate

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.gray2.cgColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            textField.layer.borderWidth = 0
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        // TODO: removeAllButton tap 시 status 변경되지 않음
        // TODO: customTextField에 정규식 추가 후 만족할 때만 activate
        usernameTextField.removeAllButton.isHidden = usernameTextField.hasText ? false : true
        passwordTextField.removeAllButton.isHidden = passwordTextField.hasText ? false : true
        if usernameTextField.hasText && passwordTextField.hasText {
            loginButton.status = .activated
        } else {
            loginButton.status = .disabled
        }
    }
}
