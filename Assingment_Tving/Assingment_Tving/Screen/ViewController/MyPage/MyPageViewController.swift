//
//  MyPageViewController.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/26.
//

import UIKit

final class MyPageViewController: BaseViewController {
    
    enum PersonalSettingList: String, CaseIterable {
        case ticket = "이용권"
        case serviceChat = "1:1 문의내역"
        case reservedNotification = "예약알림"
        case editInfo = "회원정보 수정"
        case promotion = "프로모션 정보 수신 동의"
    }
    
    enum AppInfoList: String, CaseIterable {
        case notification = "공지사항"
        case event = "이벤트"
        case custemerService = "고객센터"
        case about = "티빙 알아보기"
    }
    
    let settingList = [
        PersonalSettingList.allCases.map { $0.rawValue },
        AppInfoList.allCases.map { $0.rawValue }
    ]
    
    // MARK: - properties
    
    private let baseView = MyPageView()
    
    // MARK: - life cycles
    
    override func loadView() {
        self.view = baseView
    }
    
    // MARK: - set
    
    override func setNavigationBar() {
        super.setNavigationBar()
        
        let backButton = BackButton()
        backButton.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        navigationItem.leftBarButtonItem = makeNavigationBarButton(with: backButton)
        navigationItem.rightBarButtonItem = makeNavigationBarButton(with: baseView.navigationBarButtonStack)
    }
    
    override func setDelegate() {
        baseView.settingTableView.delegate = self
        baseView.settingTableView.dataSource = self
    }
    
}


// MARK: - UITableViewDelegate extension

extension MyPageViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0 {
            guard let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: SettingTableViewFooter.identifier)
                    as? SettingTableViewFooter else { return UITableViewHeaderFooterView() }
            return footer
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        section == 0 ? 30 : 0
    }
    
}


// MARK: - UITableViewDataSource extension

extension MyPageViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingList[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = baseView.settingTableView.dequeueReusableCell(
            withIdentifier: SettingTableViewCell.identifier) as? SettingTableViewCell
        else { return UITableViewCell() }
        cell.configureCell(title: settingList[indexPath.section][indexPath.row])
        return cell
    }
    
}
