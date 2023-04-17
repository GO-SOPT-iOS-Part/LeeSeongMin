//
//  CustomButton.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/13.
//

import UIKit

import SnapKit

final class CustomButton: UIButton {
    
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
    
    var status: Status {
        didSet { setStyle() }
    }
    
    let buttonTitle: String
    
    // MARK: - life cycle
    
    init(status: Status, with buttonTitle: String) {
        self.status = status
        self.buttonTitle = buttonTitle
        super.init(frame: .zero)
        setStyle()
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - functions
    
    private func setStyle() {
        UIView.animate(withDuration: 0.2) {
            self.backgroundColor = self.status.backgroundColor
            self.layer.borderColor = self.status.borderColor?.cgColor
            self.layer.borderWidth = self.status.borderWidth
            self.layer.cornerRadius = 3
            self.layer.masksToBounds = true
            self.setTitle(self.buttonTitle, for: .normal)
            self.titleLabel?.textColor = self.status.titleColor
            self.titleLabel?.font = UIFont.bold
        }
    }
}
