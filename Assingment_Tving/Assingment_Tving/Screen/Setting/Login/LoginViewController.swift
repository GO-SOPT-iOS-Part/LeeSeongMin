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
    
    private let usernameTextField: CustomTextField = {
        let textfield = CustomTextField(type: .username)
        textfield.textColor = .gray2
        return textfield
    }()
    
    private let passwordTextField: CustomTextField = {
        let textfield = CustomTextField(type: .password)
        return textfield
    }()
    
//    private let textfield: UITextField = {
//        let textfield = UITextField()
//        textfield.backgroundColor = .white
//        textfield.textColor = .gray2
//        textfield.placeholder = "test"
//        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
//        textfield.leftView = leftView
//        textfield.leftViewMode = .always
//        let rightView = UIImageView(image: ImageLiteral.textfieldEye)
//        textfield.rightView = rightView
//        textfield.rightViewMode = .a
//        return textfield
//    }()
    
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setStyle()
        setDelegate()
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
        
//        view.addSubview(textfield)
//        textfield.snp.makeConstraints {
//            $0.horizontalEdges.equalToSuperview().inset(20)
//            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
//            $0.height.equalTo(52)
//        }
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
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            textField.layer.borderWidth = 0
        }
    }
}
