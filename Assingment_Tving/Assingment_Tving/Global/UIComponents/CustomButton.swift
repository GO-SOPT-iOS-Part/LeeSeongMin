//
//  CustomButton.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/13.
//

import UIKit

import SnapKit

enum Status {
    case activated
    case disabled
    
    var backgroundColor: UIColor {
        switch self {
        case .activated:
            return .red1
        case .disabled:
            return .black1
        }
    }
    
    var borderColor: UIColor? {
        switch self {
        case .activated:
            return nil
        case .disabled:
            return .gray4
        }
    }
    
    var borderWidth: CGFloat {
        switch self {
        case .activated:
            return 0
        case .disabled:
            return 1
        }
    }
    
    var titleColor: UIColor {
        switch self {
        case .activated:
            return .white1
        case .disabled:
            return .gray2
        }
    }
}

final class CustomButton: UIButton {
    
    var status: Status {
        didSet { setStyle() }
    }
    
    let buttonTitle: String
    
    // MARK: - properties
    
    
    // MARK: - life cycle
    
    init(status: Status, with buttonTitle: String) {
        self.status = status
        self.buttonTitle = buttonTitle
        super.init(frame: .zero)
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - functions
    
    
    // MARK: - objc functions
    
}


// MARK: - setup extension

private extension CustomButton {
    private func setLayout() {
        
    }
    
    private func setStyle() {
        self.backgroundColor = status.backgroundColor
        self.layer.borderColor = status.borderColor?.cgColor
        self.layer.borderWidth = status.borderWidth
        self.layer.cornerRadius = 3
        self.layer.masksToBounds = true
        self.setTitle(buttonTitle, for: .normal)
        self.titleLabel?.textColor = status.titleColor
        self.titleLabel?.font = UIFont.bold
    }
}
