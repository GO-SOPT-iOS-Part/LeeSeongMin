//
//  CreateAccountView.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/25.
//

import UIKit

import SnapKit

final class CreateAccountView: BaseView {
    
    // MARK: - properties
    
    private let setUsernameLabel: UILabel = {
        let label = UILabel()
        label.text = "닉네임을 입력해주세요"
        label.font = .title
        label.textColor = .gray1
        return label
    }()
    
    let usernameTextField = CustomTextField(type: .username)
    
    let usernameAlertLabel: UILabel = {
        let label = UILabel()
        label.text = "아이디는 한글로 입력해주세요"
        label.font = UIFont.smallRegular
        label.textColor = .red1
        label.isHidden = true
        return label
    }()
    
    let saveButton: CustomButton = {
        let button = CustomButton(status: .disabled, with: "저장하기")
        button.isEnabled = false
        return button
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // MARK: -  set
    
    override func setLayout() {
        addSubview(setUsernameLabel)
        setUsernameLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        addSubview(usernameTextField)
        usernameTextField.snp.makeConstraints {
            $0.top.equalTo(setUsernameLabel.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        addSubview(usernameAlertLabel)
        usernameAlertLabel.snp.makeConstraints {
            $0.top.equalTo(usernameTextField.snp.bottom).offset(2)
            $0.leading.equalTo(usernameTextField.snp.leading).offset(2)
        }
        
        addSubview(saveButton)
        saveButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(usernameTextField.snp.bottom).offset(20)
            $0.height.equalTo(52)
        }
    }
    
}
