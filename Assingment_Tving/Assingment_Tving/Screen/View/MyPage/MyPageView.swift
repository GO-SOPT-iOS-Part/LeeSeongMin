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
    
    private let ticketView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray5
        view.setCornerRadius(to: 4)
        return view
    }()
    
    private let myTicketLabel: UILabel = {
        let label = UILabel()
        // force unwrap 싫어하지만... 있는게 확실하기 떄문에 force unwrap 해도 된다고 판단
        let leadingImage = NSTextAttachment(image: ImageLiteral.ticket!)
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(attachment: leadingImage))
        // FIXME: attributedString 에 spacing 두는 방법은 없을까?
        attributedString.append(NSAttributedString(string: " 나의 이용권"))
        label.attributedText = attributedString
        label.textColor = .gray3
        label.font = .regular
        return label
    }()
    
    private let myTicketStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "사용중인 이용권이 없습니다."
        label.textColor = .gray3
        label.font = .regular
        return label
    }()
    
    private let myCashLabel: UILabel = {
        let label = UILabel()
        // force unwrap 싫어하지만... 있는게 확실하기 떄문에 force unwrap 해도 된다고 판단
        let leadingImage = NSTextAttachment(image: ImageLiteral.cash!)
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(attachment: leadingImage))
        // FIXME: attributedString 에 spacing 두는 방법은 없을까?
        attributedString.append(NSAttributedString(string: " 티빙캐시"))
        label.attributedText = attributedString
        label.textColor = .gray3
        label.font = .regular
        return label
    }()
    
    private let myCashStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white1
        label.font = .bold
        return label
    }()
    
    // MARK: - init
    
    
    
    // MARK: -  set
    
    override func setLayout() {
        addSubview(profileImageView)
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(20)
            $0.leading.equalToSuperview().offset(SizeLiteral.sidePadding)
            $0.size.equalTo(72)
        }
        
        addSubview(usernameLabel)
        usernameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(10)
            $0.centerY.equalTo(profileImageView)
        }
        
        addSubview(changeProfileButton)
        changeProfileButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(SizeLiteral.sidePadding)
            $0.centerY.equalTo(profileImageView)
        }
        
        addSubview(ticketView)
        ticketView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(SizeLiteral.smallSidePadding)
            $0.top.equalTo(profileImageView.snp.bottom).offset(20)
        }
        
        ticketView.addSubview(myTicketLabel)
        myTicketLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(14)
            $0.top.equalToSuperview().inset(18)
        }
        
        ticketView.addSubview(myTicketStatusLabel)
        myTicketStatusLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(14)
            $0.centerY.equalTo(myTicketLabel)
        }
        
        ticketView.addSubview(myCashLabel)
        myCashLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(14)
            $0.top.equalTo(myTicketLabel.snp.bottom).offset(20)
            $0.bottom.equalToSuperview().inset(18)
        }
        
        ticketView.addSubview(myCashStatusLabel)
        myCashStatusLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(14)
            $0.centerY.equalTo(myCashLabel)
        }
    }

}
