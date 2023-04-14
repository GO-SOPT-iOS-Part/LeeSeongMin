//
//  LoginViewController.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/12.
//

import UIKit

import SnapKit

final class LoginViewController: BaseViewController {
    
    var nickname: String?
    
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
    
    private lazy var loginButton: CustomButton = {
        let button = CustomButton(status: .disabled, with: "로그인")
        button.isEnabled = false
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var findIDButton: UIButton = {
        let button = UIButton()
        button.setTitle("아이디 찾기", for: .normal)
        button.setTitleColor(.gray2, for: .normal)
        button.titleLabel?.font = UIFont.bold
        // FIXME: add button action
        return button
    }()
    
    private lazy var findPasswordButton: UIButton = {
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
    
    private let createAccountQuestionLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
        label.font = UIFont.regular
        label.textColor = .gray3
        return label
    }()
    
    private lazy var createAccountButton: UIButton = {
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
        button.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
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
        let viewController = LoginCompleteViewController()
        if let nickname {
            viewController.bindId(nickname)
        } else if let username = usernameTextField.text {
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
            sheet.delegate = self
        }
        self.present(modal, animated: true)
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
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.horizontalEdges.equalToSuperview()
        }
        
        view.addSubview(usernameTextField)
        usernameTextField.snp.makeConstraints {
            $0.top.equalTo(loginLabel.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
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
        
        view.addSubview(findViewDivider)
        findViewDivider.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(12)
            $0.width.equalTo(1)
        }

        view.addSubview(findIDButton)
        findIDButton.snp.makeConstraints {
            $0.trailing.equalTo(findViewDivider.snp.leading).offset(-36)
            $0.centerY.equalTo(findViewDivider)
        }

        view.addSubview(findPasswordButton)
        findPasswordButton.snp.makeConstraints {
            $0.leading.equalTo(findViewDivider.snp.centerX).offset(36)
            $0.centerY.equalTo(findViewDivider)
        }
        
        view.addSubview(createAccountQuestionLabel)
        createAccountQuestionLabel.snp.makeConstraints {
            $0.top.equalTo(findViewDivider.snp.bottom).offset(40)
            $0.leading.equalToSuperview().inset(50)
        }
        
        view.addSubview(createAccountButton)
        createAccountButton.snp.makeConstraints {
            $0.centerY.equalTo(createAccountQuestionLabel)
            $0.trailing.equalToSuperview().inset(50)
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


// MARK: - UISheet delegate

extension LoginViewController: UISheetPresentationControllerDelegate {
    
}


// MARK: - SaveUsernaemeProtocol delegate

extension LoginViewController: SaveUsernaemeProtocol {
    func saveUsername(_ name: String) {
        nickname = name
    }
}
