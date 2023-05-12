//
//  SettingTableViewHeader.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/27.
//

import UIKit

import SnapKit

final class SettingTableViewFooter: UITableViewHeaderFooterView {
    
    static let identifier = "SettingTableViewHeader"
    
    // MARK: - properties
    
    private let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray4
        return view
    }()
    
    // MARK: - init
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -  set
    
    private func setLayout() {
        addSubview(seperatorView)
        seperatorView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(SizeLiteral.Common.sidePadding)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(1)
        }
    }

}
