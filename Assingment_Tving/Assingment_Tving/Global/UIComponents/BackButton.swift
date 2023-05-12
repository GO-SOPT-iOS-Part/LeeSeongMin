//
//  BackButton.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/14.
//

import UIKit

final class BackButton: UIButton {
    
    init() {
        super.init(frame: .init(x: 0, y: 0, width: 30, height: 44))
        setButton()
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - setup
    
    private func setButton() {
        setImage(ImageLiteral.previous?.withTintColor(.white1, renderingMode: .alwaysOriginal), for: .normal)
    }
}
