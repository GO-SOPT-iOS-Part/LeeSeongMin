//
//  SettingTableViewCell.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/26.
//

import UIKit

import SnapKit

final class SettingTableViewCell: BaseTableViewCell {
    
    static let identifier = "SettingTableViewCell"
    
    // MARK: - properties
    
    private let menuTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray2
        label.font = .regular
        return label
    }()
    
    private let nextImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiteral.next
        imageView.tintColor = .gray2
        return imageView
    }()
    
    // MARK: -  set
    
    override func setLayout() {
        addSubview(menuTitleLabel)
        menuTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(SizeLiteral.Common.sidePadding)
            $0.centerY.equalToSuperview()
        }
        
        addSubview(nextImageView)
        nextImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(SizeLiteral.Common.sidePadding)
            $0.centerY.equalToSuperview()
        }
    }
    
    override func setStyle() {
        backgroundColor = .black1
        selectionStyle = .none
    }
    
    // MARK: - configure
    
    func configureCell(title: String) {
        menuTitleLabel.text = title
    }

}
