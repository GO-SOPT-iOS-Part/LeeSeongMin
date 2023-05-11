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
    
    var scrollViewContentOffsetY: CGFloat = 0
    
    // MARK: - properties
    
    private let baseView = HomeView()
    
    // MARK: - life cycles
    
    override func loadView() {
        self.view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeAPIService.shared.callAPI(of: HomeAPI<MoviePopularResponse>.fetchMoviePopular) { response in
            dump(response)
        }
        
        HomeAPIService.shared.callAPI(of: HomeAPI<TVPopularResponse>.fetchTVPopular) { response in
            dump(response)
        }
    }
    
    // MARK: - set
    
    override func setDelegate() {
        baseView.homeTableView.delegate = self
        baseView.homeTableView.dataSource = self
    }
    
}


// MARK: - extension UIScrollViewDelegate

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            guard let parentViewController = parent?.parent as? MainViewController else { return }
            parentViewController.scrollStickyHeader(to: scrollView.contentOffset.y)
        }
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
        default:
            return CommonContentCollectionView.Size.collectionViewHeight
        }
    }
}


// MARK: - extension

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return data.count - 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let largeCell = tableView.dequeueReusableCell(withIdentifier: LargeContentCollectionView.identifier) as? LargeContentCollectionView,
              let smallCell = tableView.dequeueReusableCell(withIdentifier: CommonContentCollectionView.identifier) as? CommonContentCollectionView
        else { return UITableViewCell() }
        
        largeCell.selectionStyle = .none
        smallCell.selectionStyle = .none
        
        switch indexPath.section {
        case 0:
            largeCell.prepareCells(data[indexPath.section])
            return largeCell
        default:
            smallCell.prepareCells(data[indexPath.section])
            return smallCell
        }
    }
    
    
}
