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
        button.setImage(ImageLiteral.notification, for: .normal)
        button.tintColor = .gray1
        button.frame = .init(x: 0, y: 0, width: 30, height: 44)
        return button
    }()
    
    let settingButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.setting, for: .normal)
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
    
    let settingTableView = SettingTableView(frame: .init(x: 0, y: 0, width: SizeLiteral.Screen.width, height: 0), style: .plain)
    
    // MARK: -  set
    
    override func setLayout() {
        
        addSubview(settingTableView)
        settingTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }

}
