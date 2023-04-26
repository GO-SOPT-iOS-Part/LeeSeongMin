//
//  MyPageViewController.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/26.
//

import UIKit

final class MyPageViewController: BaseViewController {
    
    let settingTableList = [
        ["이용권", "1:1 문의내역", "예약알림", "회원정보 수정", "프로모션 정보 수신 동의"],
        ["공지사항", "이벤트", "고객센터", "티빙 알아보기"]
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
        navigationItem.leftBarButtonItem = makeNavigationBarButton(with: backButton)
        navigationItem.rightBarButtonItem = makeNavigationBarButton(with: baseView.navigationBarButtonStack)
    }
    
    override func setDelegate() {
        baseView.settingTableView.delegate = self
        baseView.settingTableView.dataSource = self
    }
    
    // MARK: - functions
    
    
    
    // MARK: - objc functions
    

}


extension MyPageViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0 {
            let seperatorView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
            let seperator = UIView()
            seperator.backgroundColor = .gray4
            seperatorView.addSubview(seperator)
            seperator.snp.makeConstraints {
                $0.horizontalEdges.equalToSuperview().inset(SizeLiteral.smallSidePadding)
                $0.height.equalTo(1)
                $0.centerY.equalToSuperview()
            }
            return seperatorView
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 30
        }
        return 0
    }
    
}

extension MyPageViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingTableList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingTableList[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = baseView.settingTableView.dequeueReusableCell(
            withIdentifier: SettingTableViewCell.identifier) as? SettingTableViewCell
        else { return UITableViewCell() }
        cell.configureCell(title: settingTableList[indexPath.section][indexPath.row])
        return cell
    }
    
}
