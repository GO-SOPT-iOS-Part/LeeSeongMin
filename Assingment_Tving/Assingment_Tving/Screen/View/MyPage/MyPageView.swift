//
//  MyPageView.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/26.
//

import UIKit

import SnapKit

final class MyPageView: BaseView {
    
    // MARK: - properties
    
    let notificationButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bell"), for: .normal)
        button.tintColor = .gray1
        button.frame = .init(x: 0, y: 0, width: 30, height: 44)
        return button
    }()
    
    let settingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        button.tintColor = .gray1
        button.frame = .init(x: 0, y: 0, width: 30, height: 44)
        return button
    }()
    
    lazy var navigationBarButtonStack: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [notificationButton, settingButton])
        stackview.axis = .horizontal
        stackview.spacing = 10
        return stackview
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView(image: ImageLiteral.profileImage)
        imageView.contentMode = .scaleAspectFill
        imageView.setCornerRadius(to: 4)
        return imageView
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .largeBold
        label.textColor = .white1
        label.text = "Id"
        return label
    }()
    
    let changeProfileButton: UIButton = {
        let button = UIButton()
        // FIXME: contentInset 사라짐... inset 어떻게?
        button.setTitle("  프로필 전환  ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .smallRegular
        button.setBorder(color: .gray4, andWidth: 1)
        button.setCornerRadius(to: 4)
        return button
    }()
    
    // MARK: - init
    
    
    
    // MARK: -  set
    
    override func setLayout() {
        addSubview(profileImageView)
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(10)
            $0.leading.equalToSuperview().offset(SizeLiteral.sidePadding)
            $0.size.equalTo(72)
        }
        
        addSubview(usernameLabel)
        usernameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(20)
            $0.centerY.equalTo(profileImageView)
        }
        
        addSubview(changeProfileButton)
        changeProfileButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(SizeLiteral.sidePadding)
            $0.centerY.equalTo(profileImageView)
        }
    }

}
