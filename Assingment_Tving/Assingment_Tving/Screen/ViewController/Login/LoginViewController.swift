//
//  LoginViewController.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/12.
//

import UIKit

final class LoginViewController: BaseViewController {
    
    var nickname: String?
    
    // MARK: - properties
    
    private let baseView = LoginView()
    
    // MARK: - life cycle
    
    override func loadView() {
        self.view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setKeyboard()
    }
    
    // MARK: - set
    
    override func setNavigationBar() {
        super.setNavigationBar()
        
        let backButton = BackButton()
        navigationItem.leftBarButtonItem = makeNavigationBarButton(with: backButton)
    }
    
    override func setButtonTarget() {
        baseView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        baseView.createAccountButton.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
        // FIXME: findIdButton target 추가
        // FIXME: findPasswordButton target 추가
    }
    
    override func setDelegate() {
        baseView.usernameTextField.delegate = self
        baseView.passwordTextField.delegate = self
    }
    
    // MARK: - objc functions
    
    @objc
    private func loginButtonTapped() {
        let viewController = LoginCompleteViewController()
        if let nickname {
            viewController.bindId(nickname)
        } else if let username = baseView.usernameTextField.text {
            viewController.bindId(username)
        }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc
    private func createAccountButtonTapped() {
        let modal = CreateAccountViewController()
        modal.delegate = self
        if let sheet = modal.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
        }
        self.present(modal, animated: true)
    }
    
}


// MARK: - textfield delegate

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            textField.setBorder(color: .gray2, andWidth: 1)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            textField.setBorder(color: .gray2, andWidth: 0)
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        let usernameTextField = baseView.usernameTextField
        let passwordTextField = baseView.passwordTextField
        let usernameTextFieldHasText = usernameTextField.hasText
        let passwordTextFieldHasText = passwordTextField.hasText
        
        usernameTextField.removeAllButton.isHidden = usernameTextFieldHasText ? false : true
        passwordTextField.removeAllButton.isHidden = passwordTextFieldHasText ? false : true
        if usernameTextFieldHasText && passwordTextFieldHasText {
            baseView.loginButton.status = .activated
            baseView.loginButton.isEnabled = true
        } else {
            baseView.loginButton.status = .disabled
            baseView.loginButton.isEnabled = false
        }
    }
}


// MARK: - UISheet delegate

extension LoginViewController: UISheetPresentationControllerDelegate {
    
}


// MARK: - SaveUsernaemeProtocol delegate

extension LoginViewController: SaveUsernaemeProtocol {
    func saveUsername(_ name: String) {
        nickname = name
    }
}
