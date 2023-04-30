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
    
    
    
    
    weak var scrollDelegate: CollectionViewStartScrollDelegate?
    
    // MARK: - properties
    
    private let baseView = MainView()
    
    // MARK: - life cycles
    
    override func loadView() {
        self.view = baseView
    }
    
    // MARK: - set
    
    override func setDelegate() {
        baseView.segmentedButtonsView.segementedControlDelegate = self
        baseView.pageControlCollectionView.delegate = self
        baseView.pageControlCollectionView.dataSource = self
        baseView.segmentedButtonsView.segmentButtonsScrollView.delegate = self
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
    
    
    
    // MARK: - objc functions
    
    private func segmentedButtonTapped(_ index: Int) {
        indexChanged(to: index)
    }
    
    @objc
    private func myPageButtonTapped() {
        let viewController = MyPageViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}


//extension MainViewController: SegmentedControlDelegate {
//
//    func indexChanged(to index: Int) {
//        <#code#>
//    }
//
//}

extension MainViewController: SegmentedControlDelegate {
    
    func indexChanged(to index: Int) {
//        let xOffset = SizeLiteral.Screen.width * CGFloat(index)
//        moveToFrame(contentOffset: xOffset)
    }
    
    func moveToFrame(contentOffset: CGFloat) {
//        let collectionView = self.baseView.pageControlCollectionView
//        let frame = CGRect(
//            x: contentOffset,
//            y: collectionView.contentOffset.y,
//            width: collectionView.frame.width,
//            height: collectionView.frame.height
//        )
//        collectionView.scrollRectToVisible(frame, animated: true)
    }
    
}

extension MainViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        print("scroll")
    }
    
    
}


extension MainViewController: UICollectionViewDelegateFlowLayout {

}

extension MainViewController: UICollectionViewDelegate {

}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.Collection.pageControl, for: indexPath) as? PageControlCollectionViewCell
        else { return UICollectionViewCell() }
        // FIXME: 색이 아닌 페이지로 바꾸기
        cell.configureCell(titles[indexPath.row], .systemGray)
        return cell
    }


}
