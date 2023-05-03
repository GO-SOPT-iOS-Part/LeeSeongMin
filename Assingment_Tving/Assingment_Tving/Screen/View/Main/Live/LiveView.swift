//
//  LiveView.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/03.
//

import UIKit

final class LiveView: BaseView {
    
    // MARK: - properties
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "live"
        label.textColor = .white
        return label
    }()
    
    // MARK: - init
    
    
    
    // MARK: -  set
    
    override func setLayout() {
        addSubview(label)
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }

}
