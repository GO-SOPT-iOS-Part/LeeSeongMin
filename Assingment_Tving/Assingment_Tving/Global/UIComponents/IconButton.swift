//
//  IconButton.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/28.
//

import UIKit

import SnapKit

final class IconButton: UIButton {
    
    // MARK: - init
    
    init(frame: CGRect, icon: UIImage, with color: UIColor) {
        super.init(frame: frame)
        
        setStyle(icon, with: color)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -  set
    
    private func setStyle(_ image: UIImage, with color: UIColor) {
        setImage(image, for: .normal)
        tintColor = color
    }

}
