//
//  LoginCompleteView.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/25.
//

import UIKit

import SnapKit

final class LoginCompleteView: BaseView {
    
    // MARK: - properties
    
    private let mainPosterImageView = UIImageView(image: ImageLiteral.mainPoster)
    
    let completeLabel: UILabel = {
        let label = UILabel()
        label.text = "님\n반가워요"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .white1
        label.font = UIFont.title
        return label
    }()
    
    let completeButton: CustomButton = {
        let button = CustomButton(status: .activated, with: "메인으로")
        button.backgroundColor = button.status.backgroundColor
        return button
    }()
    
    // MARK: -  set
    
    override func setLayout() {
        addSubview(mainPosterImageView)
        mainPosterImageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(safeAreaLayoutGuide)
        }
        
        addSubview(completeLabel)
        completeLabel.snp.makeConstraints {
            $0.top.equalTo(mainPosterImageView.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
        }
        
        addSubview(completeButton)
        completeButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(SizeLiteral.Button.height)
        }
    }


}
