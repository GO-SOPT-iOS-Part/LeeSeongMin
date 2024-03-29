//
//  CustomTextField.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/12.
//

import UIKit

import SnapKit

final class CustomTextField: UITextField {
    
    enum TextFieldType {
        case username
        case password
        
        var isSecure: Bool {
            switch self {
            case .username:
                return false
            case .password:
                return true
            }
        }
        
        var placeholder: String {
            switch self {
            case .username:
                return "아이디"
            case .password:
                return "비밀번호"
            }
        }
        
        var buttonCount: Int {
            switch self {
            case .username:
                return 1
            case .password:
                return 2
            }
        }
    }
    
    private enum Size {
        static let buttonSize = 20
        static let buttonPadding = 10
    }
    
    let textFieldType: TextFieldType
    
    // MARK: - properties
    
    lazy var removeAllButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.textfieldRemove, for: .normal)
        button.addTarget(self, action: #selector(tappedRemoveAllButton), for: .touchUpInside)
        button.tintColor = .gray2
        button.isHidden = true
        return button
    }()
    
    private lazy var revealSecureTextButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.textfieldEye, for: .normal)
        button.addTarget(self, action: #selector(tappedRevealSecureTextButton), for: .touchUpInside)
        button.tintColor = .gray2
        return button
    }()
    
    // MARK: - life cycle
    
    init(type: TextFieldType) {
        self.textFieldType = type
        super.init(frame: .zero)
        setStyle()
        setSideViews()
        setPlaceholder()
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - functions
    
    
    // MARK: - objc functions
    
    @objc
    private func tappedRemoveAllButton() {
        self.text?.removeAll()
    }
    
    @objc
    private func tappedRevealSecureTextButton() {
        isSecureTextEntry.toggle()
    }
    
    // MARK: - setup
    
    private func setStyle() {
        setCornerRadius(to: 4)
        self.backgroundColor = .gray4
        self.textColor = .gray2
        self.isSecureTextEntry = textFieldType.isSecure
    }
    
    private func setSideViews() {
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        let rightView = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: textFieldType.buttonCount * (Size.buttonSize + Size.buttonPadding),
            height: Size.buttonSize
        ))
        switch textFieldType {
        case .username:
            removeAllButton.frame = .init(x: 0, y: 0, width: Size.buttonSize, height: Size.buttonSize)
            rightView.addSubview(removeAllButton)
        case .password:
            removeAllButton.frame = .init(x: 0, y: 0, width: Size.buttonSize, height: Size.buttonSize)
            revealSecureTextButton.frame = .init(x: Size.buttonSize + Size.buttonPadding, y: 0, width: Size.buttonSize, height: Size.buttonSize)
            rightView.addSubview(removeAllButton)
            rightView.addSubview(revealSecureTextButton)
        }
        
        self.leftView = leftView
        self.leftViewMode = .always
        self.rightView = rightView
        self.rightViewMode = .whileEditing
    }
    
    private func setPlaceholder() {
        let placeholder = NSAttributedString(
            string: textFieldType.placeholder,
            attributes: [
                .foregroundColor: UIColor.gray2,
                .font: UIFont.regular
            ]
        )
        self.attributedPlaceholder = placeholder
    }
}

