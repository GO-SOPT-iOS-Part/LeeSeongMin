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
    
    let notificationButton = IconButton(frame: SizeLiteral.Button.iconButtonFrame, icon: ImageLiteral.notification!, with: .gray1)
    
    let settingButton = IconButton(frame: SizeLiteral.Button.iconButtonFrame, icon: ImageLiteral.setting!, with: .gray1)
    
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
