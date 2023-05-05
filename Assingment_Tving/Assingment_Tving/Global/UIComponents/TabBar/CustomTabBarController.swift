//
//  CustomTabBarController.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/05.
//

import UIKit

final class CustomTabBarController: UITabBarController {
    
    private enum TabBarItem: CaseIterable {
        case home
        case beforeRelease
        case search
        case record
        
        var image: UIImage {
            switch self {
            case .home:
                return ImageLiteral.home
            case .beforeRelease:
                return ImageLiteral.beforeRelease
            case .search:
                return ImageLiteral.search
            case .record:
                return ImageLiteral.record
            }
        }
        
        var label: String {
            switch self {
            case .home:
                return "홈"
            case .beforeRelease:
                return "공개예정"
            case .search:
                return "검색"
            case .record:
                return "기록"
            }
        }
        
        var viewController: UIViewController {
            switch self {
            case .home:
                return MainViewController()
            case .beforeRelease:
                return BeforeReleaseViewController()
            case .search:
                return SearchViewController()
            case .record:
                return RecordViewController()
            }
        }
    }
    
    // MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBarItems()
        setStyle()
    }
    
    // MARK: -  set
    
    private func setTabBarItems() {
        var viewControllers: [UIViewController] = []
        TabBarItem.allCases.enumerated().forEach { (i, item) in
            let tabBarItem = UITabBarItem(title: item.label, image: item.image, tag: i)
            let viewController = UINavigationController(rootViewController: item.viewController)
            viewController.tabBarItem = tabBarItem
            viewControllers.append(viewController)
        }
        self.viewControllers = viewControllers
    }
    
    private func setStyle() {
        self.tabBar.tintColor = .white1
        self.tabBar.barTintColor = .black1
        self.tabBar.isTranslucent = false
        self.tabBar.unselectedItemTintColor = .gray3
    }
    
}
