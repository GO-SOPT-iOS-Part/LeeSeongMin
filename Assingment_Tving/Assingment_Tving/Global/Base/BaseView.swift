//
//  BaseView.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/25.
//

import UIKit

import SnapKit

class BaseView: UIView {
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        setStyle()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - set
    
    func setStyle() {
        // override to use
        backgroundColor = .black1
    }
    
    func setLayout() {
        // ovverride to use
    }
    
}
