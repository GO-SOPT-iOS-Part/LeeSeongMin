//
//  MainView.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/26.
//

import UIKit

import SnapKit

final class MainView: BaseView {
    
    // MARK: - properties
    
    let myPageButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.profileImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    // MARK: - init
    
    
    
    // MARK: -  set
    
    override func setLayout() {
        addSubview(myPageButton)
        myPageButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }

}
