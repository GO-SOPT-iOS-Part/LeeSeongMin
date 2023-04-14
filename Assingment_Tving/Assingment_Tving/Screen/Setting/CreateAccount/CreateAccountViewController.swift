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
    
    private let saveButton: CustomButton = {
        let button = CustomButton(status: .disabled, with: "저장하기")
        button.isEnabled = false
        
        return button
    }()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setKeyboard()
        setDelegate()
    }
    
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
        
        view.addSubview(saveButton)
        saveButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(usernameTextField.snp.bottom).offset(20)
            $0.height.equalTo(52)
        }
    }
    
    override func setStyle() {
        view.backgroundColor = .gray5
    }
    
    private func setDelegate() {
        usernameTextField.delegate = self
    }
}


// MARK: - textfield delegate

extension CreateAccountViewController: UITextFieldDelegate {
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
        if textField.hasText {
            usernameTextField.removeAllButton.isHidden = false
            saveButton.status = .activated
        }
    }
}
