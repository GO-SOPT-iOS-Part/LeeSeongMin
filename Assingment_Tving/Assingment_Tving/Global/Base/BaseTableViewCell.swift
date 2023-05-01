//
//  BaseTableViewCell.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/02.
//

import UIKit

final class BaseTableViewCell: UITableViewCell {
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayout()
        setStyle()
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
