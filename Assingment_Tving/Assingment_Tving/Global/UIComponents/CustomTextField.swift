//
//  CustomTextField.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/12.
//

import UIKit

import SnapKit

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
}

final class CustomTextField: UITextField {
    
    private enum Size {
        static let buttonSize: CGFloat = 44
    }
    
    let textFieldType: TextFieldType
    
    // MARK: - properties
    
    private lazy var rightButtonView = UIView()
    
    private lazy var removeAllButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.textfieldRemove, for: .normal)
        button.tintColor = .gray2
        button.addTarget(self, action: #selector(tappedRemoveAllButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var revealSecureTextButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.textfieldEye, for: .normal)
        button.tintColor = .gray2
        button.addTarget(self, action: #selector(tappedRevealSecureTextButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - life cycle
    
    init(type: TextFieldType) {
        self.textFieldType = type
        super.init(frame: .zero)
        setLayout()
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
        if self.isSecureTextEntry == true {
            self.isSecureTextEntry = false
        } else {
            self.isSecureTextEntry = true
        }
    }
}


// MARK: - setup extension

private extension CustomTextField {
    private func setLayout() {
        rightButtonView.addSubview(removeAllButton)
        removeAllButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
        }
        
        if textFieldType == .password {
            rightButtonView.addSubview(revealSecureTextButton)
            revealSecureTextButton.snp.makeConstraints {
                $0.trailing.equalTo(removeAllButton.snp.leading).offset(-8)
                $0.centerY.equalToSuperview()
            }
        }
    }
    
    private func setStyle() {
        self.backgroundColor = .gray4
        self.textColor = .gray2
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
        self.isSecureTextEntry = textFieldType.isSecure
        layoutSubviews()
    }
    
    private func setSideViews() {
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        self.leftView = leftView
        self.leftViewMode = .always
        self.rightView = rightButtonView
        self.rightViewMode = .whileEditing
    }
    
    private func setPlaceholder() {
        let placeholder = NSAttributedString(
            string: textFieldType.placeholder,
            attributes: [.foregroundColor: UIColor.gray2]
        )
        self.attributedPlaceholder = placeholder
    }
}
