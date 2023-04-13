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
    
    private let loginButton: CustomButton = {
        let button = CustomButton(status: .disabled, with: "로그인")
        button.isEnabled = false
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let findView = UIView()
    
    private let findIDButton: UIButton = {
        let button = UIButton()
        button.setTitle("아이디 찾기", for: .normal)
        button.setTitleColor(.gray2, for: .normal)
        button.titleLabel?.font = UIFont.bold
        // FIXME: add button action
        return button
    }()
    
    private let findPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호 찾기", for: .normal)
        button.setTitleColor(.gray2, for: .normal)
        button.titleLabel?.font = UIFont.bold
        // FIXME: add button action
        return button
    }()
    
    private let findViewDivider: UIView = {
        let view = UIView()
        view.backgroundColor = .gray4
        return view
    }()
    
    private let createAccountQuestionView = UIView()
    
    private let createAccountQuestionLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
        label.font = UIFont.regular
        label.textColor = .gray3
        return label
    }()
    
    private let createAccountQuestionButton: UIButton = {
        let button = UIButton()
        let attributedText = NSAttributedString(
            string: "닉네임 만들러가기",
            attributes: [
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .underlineColor: UIColor.gray2,
                .font: UIFont.regular,
                .foregroundColor: UIColor.gray2
            ])
        button.setAttributedTitle(attributedText, for: .normal)
        // FIXME: add button action
        return button
    }()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setKeyboard()
    }
    
    // MARK: - functions
    
    
    // MARK: - objc functions
    
    @objc
    private func loginButtonTapped() {
        let viewController = LoginCompletViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    // MARK: - setup
    
    override func setNavigationBar() {
        super.setNavigationBar()
        
        let backButton = BackButton()
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
        
        view.addSubview(findView)
        findView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(24)
        }
        
        findView.addSubview(findViewDivider)
        findViewDivider.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(12)
            $0.width.equalTo(1)
        }

        findView.addSubview(findIDButton)
        findIDButton.snp.makeConstraints {
            $0.trailing.equalTo(findViewDivider.snp.leading).offset(-36)
            $0.centerY.equalToSuperview()
        }

        findView.addSubview(findPasswordButton)
        findPasswordButton.snp.makeConstraints {
            $0.leading.equalTo(findViewDivider.snp.centerX).offset(36)
            $0.centerY.equalToSuperview()
        }
        
        view.addSubview(createAccountQuestionView)
        createAccountQuestionView.snp.makeConstraints {
            $0.top.equalTo(findView.snp.bottom).offset(40)
            $0.horizontalEdges.equalToSuperview().inset(50)
        }
        
        createAccountQuestionView.addSubview(createAccountQuestionLabel)
        createAccountQuestionLabel.snp.makeConstraints {
            $0.leading.centerY.equalToSuperview()
        }
        
        createAccountQuestionView.addSubview(createAccountQuestionButton)
        createAccountQuestionButton.snp.makeConstraints {
            $0.trailing.centerY.equalToSuperview()
            $0.width.equalTo(128)
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
        
        let usernameTextFieldHasText = usernameTextField.hasText
        let passwordTextFieldHasText = passwordTextField.hasText
        
        usernameTextField.removeAllButton.isHidden = usernameTextFieldHasText ? false : true
        passwordTextField.removeAllButton.isHidden = passwordTextFieldHasText ? false : true
        if usernameTextFieldHasText && passwordTextFieldHasText {
            loginButton.status = .activated
            loginButton.isEnabled = true
        } else {
            loginButton.status = .disabled
            loginLabel.isEnabled = false
        }
    }
}
