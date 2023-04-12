//
//  LoginViewController.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/12.
//

import UIKit

import SnapKit

final class LoginViewController: UIViewController {
    
    // MARK: - properties
    
    private let usernameTextField = CustomTextField(type: .username)
    
    private let passwordTextField = CustomTextField(type: .password)
    
    private let loginButton = CustomButton(status: .disabled, with: "로그인")
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setStyle()
        setDelegate()
        setKeyboard()
    }
    
    // MARK: - functions
    
    
    // MARK: - objc functions
    
}


// MARK: - setup extension

private extension LoginViewController {
    private func setLayout() {
        view.addSubview(usernameTextField)
        usernameTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(view.safeAreaLayoutGuide)
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
    
    private func setStyle() {
        view.backgroundColor = .black1
    }
    
    private func setDelegate() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.gray2.cgColor
        }
        
        if textField == self.passwordTextField {
            self.passwordTextField.removeAllButton.isHidden = false
        } else if textField == self.usernameTextField {
            self.usernameTextField.removeAllButton.isHidden = false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            textField.layer.borderWidth = 0
        }
        
        if textField == self.passwordTextField {
            self.passwordTextField.removeAllButton.isHidden = true
        } else if textField == self.usernameTextField {
            self.usernameTextField.removeAllButton.isHidden = true
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        // TODO: removeAllButton tap 시 status 변경되지 않음
        // TODO: customTextField에 정규식 추가 후 만족할 때만 activate
        if usernameTextField.hasText && passwordTextField.hasText {
            loginButton.status = .activated
        } else {
            loginButton.status = .disabled
        }
    }
}
