//
//  CreateAccountViewController.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/14.
//

import UIKit

import SnapKit

protocol SaveUsernaemeProtocol: AnyObject {
    func saveUsername(_ name: String)
}

final class CreateAccountViewController: BaseViewController {
    
    weak var delegate: SaveUsernaemeProtocol?
    
    // MARK: - properties
    
    private let setUsernameLabel: UILabel = {
        let label = UILabel()
        label.text = "닉네임을 입력해주세요"
        label.font = .title
        label.textColor = .gray1
        return label
    }()
    
    private let usernameTextField = CustomTextField(type: .username)
    
    private let usernameAlertLabel: UILabel = {
        let label = UILabel()
        label.text = "아이디는 한글로 입력해주세요"
        label.font = UIFont.smallRegular
        label.textColor = .red1
        label.isHidden = true
        return label
    }()
    
    private lazy var saveButton: CustomButton = {
        let button = CustomButton(status: .disabled, with: "저장하기")
        button.isEnabled = false
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
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
    
    @objc
    private func saveButtonTapped() {
        guard let name = usernameTextField.text else { return }
        delegate?.saveUsername(name)
        dismiss(animated: true)
    }
    
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
        
        view.addSubview(usernameAlertLabel)
        usernameAlertLabel.snp.makeConstraints {
            $0.top.equalTo(usernameTextField.snp.bottom).offset(2)
            $0.leading.equalTo(usernameTextField.snp.leading).offset(2)
        }
        
        view.addSubview(saveButton)
        saveButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(usernameTextField.snp.bottom).offset(30)
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
            guard let text = textField.text else { return }
            let textIsOnlyKorean = text.isOnlyKorean()
            saveButton.status = textIsOnlyKorean ? .activated : .disabled
            saveButton.isEnabled = textIsOnlyKorean ? true : false
            usernameAlertLabel.isHidden = textIsOnlyKorean ? true : false
        } else {
            saveButton.status = .disabled
            saveButton.isEnabled = false
            usernameAlertLabel.isHidden = true
        }
    }
}
