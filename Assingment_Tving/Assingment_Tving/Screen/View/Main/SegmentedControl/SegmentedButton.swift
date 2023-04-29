//
//  SegmentedButton.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/28.
//

import UIKit

import SnapKit

final class SegmentedButton: UIButton {
    
    // MARK: - init
    
    init(title: String) {
        super.init(frame: .zero)
        setButton()
        setTitle(title, for: .normal)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -  set
    
    private func setButton() {
        setTitleColor(.white1, for: .normal)
        titleLabel?.font = .regular
    }
    
    // MARK: - functions
    
    func replaceTitleWithAttributedTitle(_ title: NSMutableAttributedString) {
        setAttributedTitle(title, for: .normal)
    }

}
