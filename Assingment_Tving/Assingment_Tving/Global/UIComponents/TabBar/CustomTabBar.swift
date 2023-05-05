//
//  CustomTabBar.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/05.
//

import UIKit

final class CustomTabBar: UITabBar {
    
    // MARK: - properties
    
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
                return ImageLiteral.search
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTabBarItems()
        setStyle()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -  set
    
    private func setTabBarItems() {
        TabBarItem.allCases.enumerated().forEach { (i, item) in
            let tabBarItem = UITabBarItem(title: item.label, image: item.image, tag: i)
            item.viewController.tabBarItem = tabBarItem
        }
    }
    
    private func setStyle() {
        backgroundColor = .black1
    }
    
}
