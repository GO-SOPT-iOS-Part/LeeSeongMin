//
//  SettingTableView.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/26.
//

import UIKit

final class SettingTableView: UITableView {

    // MARK: - init
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        setTableViewCell()
        setTableViewStyle()
        setTableViewHeaderFooter()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -  set
    
    private func setTableViewCell() {
        register(SettingTableViewFooter.self, forHeaderFooterViewReuseIdentifier: SettingTableViewFooter.identifier)
        register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
    }
    
    private func setTableViewStyle() {
        rowHeight = SizeLiteral.Button.height
        backgroundColor = .black1
        separatorStyle = .none
        sectionFooterHeight = 0
    }
    
    private func setTableViewHeaderFooter() {
        let headerView = MyPageHeaderView()
        headerView.frame = CGRect(x: 0, y: 0, width: SizeLiteral.Screen.width, height: 300)
        tableHeaderView = headerView
        
        let footerView = UIView()
        footerView.frame = CGRect(x: 0, y: 0, width: SizeLiteral.Screen.width, height: 72)
        let footer = CustomButton(status: .disabled, with: "로그아웃")
        footerView.addSubview(footer)
        footer.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(SizeLiteral.Common.sidePadding)
            $0.verticalEdges.equalToSuperview().inset(10)
        }
        tableFooterView = footerView
    }

}
