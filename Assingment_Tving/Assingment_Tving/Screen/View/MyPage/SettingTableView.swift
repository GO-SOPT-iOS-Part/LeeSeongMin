//
//  SettingTableView.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/26.
//

import UIKit

final class SettingTableView: UITableView {
    
    // MARK: - properties
    
    override var intrinsicContentSize: CGSize {
        return self.contentSize
    }

    
    // MARK: - init
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        setTableViewCell()
        setTableViewStyle()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -  set
    
    private func setTableViewCell() {
        register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
    }
    
    private func setTableViewStyle() {
        rowHeight = 54
        backgroundColor = .black1
        isScrollEnabled = false
        separatorStyle = .none
    }

}
