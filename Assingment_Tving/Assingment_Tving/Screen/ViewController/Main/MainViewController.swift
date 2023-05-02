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
    
    lazy var pageViewController: UIPageViewController = {
        let viewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        return viewController
    }()
    
    // MARK: - life cycles
    
    override func loadView() {
        self.view = baseView
    }
    
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
            $0.edges.equalToSuperview()
        }
    }
    
    private func setPageViewController() {
        if let firstViewController = pageViewControllerData.first {
            pageViewController.setViewControllers([firstViewController], direction: .forward, animated: true)
        }
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
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? BaseViewController,
              let index = pageViewControllerData.firstIndex(of: vc)
        else { return nil }
        
        let previousIndex = (index - 1)
        if previousIndex < 0 {
            return pageViewControllerData[titles.count - 1]
        }
        return pageViewControllerData[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? BaseViewController,
              let index = pageViewControllerData.firstIndex(of: vc)
        else { return nil }
        
        let previousIndex = (index + 1) % pageViewControllerData.count
        return pageViewControllerData[previousIndex]
    }
    
    
}


