//
//  MainViewController.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/26.
//

import UIKit

final class MainViewController: BaseViewController {
    
    // FIXME: 색이 아닌 페이지로 바꾸기
    enum Titles: String, CaseIterable {
        case home = "홈"
        case live = "􀵨 실시간"
        case tvProgram = "TV프로그램"
        case movie = "영화"
        case paramount = "파라마운트"
        case kids = "키즈"
    }
    
    private let titles = Titles.allCases.map { $0.rawValue }
    
    private let data = DummyColor.dummy()
    
    weak var scrollDelegate: CollectionViewStartScrollDelegate?
    
    // MARK: - properties
    
    private let baseView = MainView()
    
    // MARK: - life cycles
    
    override func loadView() {
        self.view = baseView
    }
    
    // MARK: - set
    
    override func setNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func setDelegate() {
        baseView.segmentedButtonsView.segmentButtonsScrollView.delegate = self
        baseView.segmentedButtonsView.segementedControlDelegate = self
        
        baseView.mainTableView.delegate = self
        baseView.mainTableView.dataSource = self
    }
    
    override func setButtonTarget() {
        for (i, button) in baseView.segmentedButtonsView.segmentButtons.enumerated() {
            let action = UIAction { [weak self] _ in
                self?.segmentedButtonTapped(i)
            }
            button.addAction(action, for: .touchUpInside)
        }
    }
    
    // MARK: - functions
    
    private func segmentedButtonTapped(_ index: Int) {
        indexChanged(to: index)
    }
    
    // MARK: - objc functions
    
    @objc
    private func myPageButtonTapped() {
        let viewController = MyPageViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}


// MARK: - extension UIScrollViewDelegate

extension MainViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
    }
    
}


// MARK: - extension SegmentedControlDelegate

extension MainViewController: SegmentedControlDelegate {
    
    func indexChanged(to index: Int) {
        let scrollView = baseView.segmentedButtonsView.segmentButtonsScrollView
        if index == 1 {
            scrollView.scrollToLeft()
        } else if index == 4 {
            scrollView.scrollToRight()
        }
    }
    
    func moveToFrame(contentOffset: CGFloat) {
        
    }
    
}


// MARK: - extension UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}


// MARK: - extension

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // FIXME: 데이터 추가해 둔 뒤 switch case 문으로 바꾸기
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let largeCell = tableView.dequeueReusableCell(withIdentifier: TvingLargeCollectionView.identifier) as? TvingLargeCollectionView,
              let smallCell = tableView.dequeueReusableCell(withIdentifier: TvingSmallCollectionView.identifier) as? TvingSmallCollectionView
        else { return UITableViewCell() }
        
        largeCell.selectionStyle = .none
        smallCell.selectionStyle = .none
        
        if indexPath.section == 0 {
            return largeCell
        } else {
            smallCell.prepareCells(data[indexPath.section])
            return smallCell
        }
    }
    
    
}
