//
//  BaseView.swift
//  Fourth_Seminar
//
//  Created by 이성민 on 2023/05/06.
//

import UIKit

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
    
    // MARK: -  set
    
    func setLayout() {
        
    }
    
    func setStyle() {
        
    }
    
}
