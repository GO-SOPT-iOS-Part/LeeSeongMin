//
//  BaseCollectionViewCell.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/02.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -  set
    
    private func setStyle() {
        // override to use
    }
    
    private func setLayout() {
        // override to use
    }
    
}
