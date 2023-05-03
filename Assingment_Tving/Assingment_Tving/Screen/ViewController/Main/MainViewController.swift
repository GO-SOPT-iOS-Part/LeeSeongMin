//
//  MainViewController.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/03.
//

import UIKit

final class MainViewController: BaseViewController {
    
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
    
    let baseView = MainView()
    
    let homeViewController = HomeViewController()
    let liveViewController = LiveViewController()
    let tvViewController = TVViewController()
    let movieViewController = MovieViewController()
    let paramountViewController = ParamountViewController()
    let kidsViewController = KidsViewController()
    
    lazy var pageViewControllerData: [BaseViewController] = {
        return [
            homeViewController,
            liveViewController,
            tvViewController,
            movieViewController,
            paramountViewController,
            kidsViewController
        ]
    }()
    
    lazy var pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    // MARK: - life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setPageViewController()
    }
    
    // MARK: - set
    
    override func setNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func setDelegate() {
        baseView.segmentedButtonsView.segmentButtonsScrollView.delegate = self
        baseView.segmentedButtonsView.segementedControlDelegate = self
        
        pageViewController.delegate = self
        pageViewController.dataSource = self
    }
    
    override func setButtonTarget() {
        for (i, button) in baseView.segmentedButtonsView.segmentButtons.enumerated() {
            let action = UIAction { [weak self] _ in
                self?.segmentedButtonTapped(i)
            }
            button.addAction(action, for: .touchUpInside)
        }
    }
    
    private func setHierarchy() {
        addChild(pageViewController)
        
        view.addSubview(pageViewController.view)
        pageViewController.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        view.addSubview(baseView)
        baseView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
        }
    }
    
    private func setPageViewController() {
        if let firstViewController = pageViewControllerData.first {
            pageViewController.setViewControllers([firstViewController], direction: .forward, animated: true)
        }
        pageViewController.didMove(toParent: self)
    }
    
    // MARK: - functions
    
    private func segmentedButtonTapped(_ index: Int) {
        indexChanged(to: index)
    }
    
    // MARK: - objc functions
    

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


// MARK: - extension

extension MainViewController: UIPageViewControllerDelegate {
    
}


// MARK: - extension

extension MainViewController: UIPageViewControllerDataSource {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.pageViewControllerData.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? BaseViewController,
              let index = pageViewControllerData.firstIndex(of: vc)
        else { return nil }
        
        let pageCount = pageViewControllerData.count
        let previousIndex = (index + pageCount - 1) % pageCount
        return pageViewControllerData[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? BaseViewController,
              let index = pageViewControllerData.firstIndex(of: vc)
        else { return nil }
        
        let nextIndex = (index + 1) % pageViewControllerData.count
        return pageViewControllerData[nextIndex]
    }
    
    
}


