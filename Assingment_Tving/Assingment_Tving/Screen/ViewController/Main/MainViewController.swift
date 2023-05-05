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
    
    private var currentIndex = 0 {
        didSet {
            segmentedButtonsView.configBottomIndicator(to: currentIndex)
        }
    }
    
    // MARK: - properties
    
    private let tvingBannerImageView: UIImageView = {
        let imageView = UIImageView(image: ImageLiteral.tvingLogo)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let profileButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.profileImage, for: .normal)
        button.imageView?.contentMode = .scaleToFill
        button.setCornerRadius(to: 4)
        return button
    }()
    
    private let tvingBannerView = UIView()
    
    private let segmentedButtonsView = SegmentedButtonsView()
    
    private lazy var pageViewControllerData: [BaseViewController] = {
        return [
            HomeViewController(),
            LiveViewController(),
            TVViewController(),
            MovieViewController(),
            ParamountViewController(),
            KidsViewController()
        ]
    }()
    
    private lazy var pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    // MARK: - life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setPageViewController()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated);
        super.viewWillDisappear(animated)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK: - set
    
    override func setNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func setDelegate() {
        segmentedButtonsView.segmentButtonsScrollView.delegate = self
        segmentedButtonsView.segementedControlDelegate = self
        
        pageViewController.delegate = self
        pageViewController.dataSource = self
    }
    
    override func setButtonAction() {
        for (i, button) in segmentedButtonsView.segmentButtons.enumerated() {
            let action = UIAction { [weak self] _ in
                self?.segmentedButtonTapped(i)
            }
            button.addAction(action, for: .touchUpInside)
        }
        
        let profileButtonAction = UIAction { [weak self] _ in
            self?.navigationController?.pushViewController(MyPageViewController(), animated: false)
        }
        profileButton.addAction(profileButtonAction, for: .touchUpInside)
    }
    
    private func setLayout() {
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        view.addSubview(tvingBannerView)
        tvingBannerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        tvingBannerView.addSubview(tvingBannerImageView)
        tvingBannerImageView.snp.makeConstraints {
            $0.leading.verticalEdges.equalToSuperview().inset(SizeLiteral.Common.sideSmallPadding)
            $0.height.equalTo(33)
        }
        
        tvingBannerView.addSubview(profileButton)
        profileButton.snp.makeConstraints {
            $0.trailing.verticalEdges.equalToSuperview().inset(SizeLiteral.Common.sideSmallPadding)
            $0.size.equalTo(33)
        }
        
        view.addSubview(segmentedButtonsView)
        segmentedButtonsView.snp.makeConstraints {
            $0.top.equalTo(tvingBannerView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(50)
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
        if index > currentIndex {
            pageViewController.setViewControllers([pageViewControllerData[index]], direction: .forward, animated: true)
        } else if index < currentIndex {
            pageViewController.setViewControllers([pageViewControllerData[index]], direction: .reverse, animated: true)
        }
        currentIndex = index
    }
    
}


// MARK: - extension UIScrollViewDelegate

extension MainViewController: UIScrollViewDelegate { }


// MARK: - extension SegmentedControlDelegate

extension MainViewController: SegmentedControlDelegate {
    func scrollToCorrectPos(near index: Int) {
        let scrollView = segmentedButtonsView.segmentButtonsScrollView
        if index <= 2 {
            scrollView.scrollToLeft()
        } else if index >= 3 {
            scrollView.scrollToRight()
        }
    }
}


// MARK: - extension UIPageViewControllerDelegate

extension MainViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        guard let viewController = pendingViewControllers.first as? BaseViewController else { return }
        guard let incomingIndex = pageViewControllerData.firstIndex(of: viewController) else { return }
        
        scrollToCorrectPos(near: incomingIndex)
        currentIndex = incomingIndex
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewController = pageViewController.viewControllers?.first as? BaseViewController else { return }
        guard let index = pageViewControllerData.firstIndex(of: viewController) else { return }
        
        currentIndex = index
    }
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
        
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        return pageViewControllerData[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? BaseViewController,
              let index = pageViewControllerData.firstIndex(of: vc)
        else { return nil }
        
        let nextIndex = index + 1
        if nextIndex >= pageViewControllerData.count {
            return nil
        }
        return pageViewControllerData[nextIndex]
    }
    
    
}


