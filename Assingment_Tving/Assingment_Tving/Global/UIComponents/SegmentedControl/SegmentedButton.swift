//
//  SegmentedButton.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/28.
//

import UIKit

import SnapKit

final class SegmentedButton: UIButton {
    
    // MARK: - properties
    
    let buttonTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .regular
        label.textColor = .white1
        return label
    }()
    
    // MARK: - init
    
    init(title: String) {
        super.init(frame: .zero)
        setLayout()
        setTitleLabel(title)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -  set
    
    private func setLayout() {
        addSubview(buttonTitleLabel)
        buttonTitleLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(15)
            $0.centerY.equalToSuperview()
        }
    }
    
    private func setTitleLabel(_ title: String) {
        buttonTitleLabel.text = title
    }
    
    // MARK: - functions
    
    func replaceTitleWithAttributedTitle(_ title: NSMutableAttributedString) {
        buttonTitleLabel.attributedText = title
    }

}
