//
//  SearchView.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/05.
//

import UIKit

final class SearchView: BaseView {
    
    // MARK: - properties
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "검색"
        label.textColor = .white1
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
