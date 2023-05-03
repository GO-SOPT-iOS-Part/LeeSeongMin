//
//  MainViewController.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/26.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    // FIXME: 색이 아닌 페이지로 바꾸기
    private let data = DummyColor.dummy()
    
    // MARK: - properties
    
    private let baseView = HomeView()
    
    // MARK: - life cycles
    
    override func loadView() {
        self.view = baseView
    }
    
    // MARK: - set
    
    override func setDelegate() {
        baseView.homeTableView.delegate = self
        baseView.homeTableView.dataSource = self
    }
    
}


// MARK: - extension UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return LargeContentCollectionView.Size.collectionViewHeight
        case 1:
            return CommonContentCollectionView.Size.collectionViewHeight
        default:
            return 0
        }
    }
}


// MARK: - extension

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // FIXME: 데이터 추가해 둔 뒤 switch case 문으로 바꾸기
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let largeCell = tableView.dequeueReusableCell(withIdentifier: LargeContentCollectionView.identifier) as? LargeContentCollectionView,
              let smallCell = tableView.dequeueReusableCell(withIdentifier: CommonContentCollectionView.identifier) as? CommonContentCollectionView
        else { return UITableViewCell() }
        
        largeCell.selectionStyle = .none
        smallCell.selectionStyle = .none
        
        if indexPath.section == 0 {
            largeCell.prepareCells(data[indexPath.section])
            return largeCell
        } else {
            smallCell.prepareCells(data[indexPath.section])
            return smallCell
        }
    }
    
    
}
