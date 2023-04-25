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
    
    private let baseView = CreateAccountView()
    
    // MARK: - life cycle
    
    override func loadView() {
        self.view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setKeyboard()
        setDelegate()
        setButtonTarget()
    }
    
    // MARK: - setup
    
    private func setDelegate() {
        baseView.usernameTextField.delegate = self
    }
    
    private func setButtonTarget() {
        baseView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - objc functions
    
    @objc
    private func saveButtonTapped() {
        guard let name = baseView.usernameTextField.text else { return }
        delegate?.saveUsername(name)
        dismiss(animated: true)
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
        
        let saveButton = baseView.saveButton
        let usernameAlertLabel = baseView.usernameAlertLabel
        
        guard let textfield = textField as? CustomTextField else { return }
        
        if textfield.hasText {
            textfield.removeAllButton.isHidden = false
            guard let text = textfield.text else { return }
            let textIsOnlyKorean = text.isOnlyKorean()
            saveButton.status = textIsOnlyKorean ? .activated : .disabled
            saveButton.isEnabled = textIsOnlyKorean
            usernameAlertLabel.isHidden = textIsOnlyKorean
        } else {
            saveButton.status = .disabled
            saveButton.isEnabled = false
            usernameAlertLabel.isHidden = true
        }
    }
}
