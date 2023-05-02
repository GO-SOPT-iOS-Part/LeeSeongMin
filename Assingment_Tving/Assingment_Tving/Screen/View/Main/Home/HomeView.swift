//
//  MainView.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/26.
//

import UIKit

import SnapKit

final class HomeView: BaseView {
    
    // MARK: - properties
    
    let homeTableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .clear
        view.separatorStyle = .none
        view.showsVerticalScrollIndicator = false
        view.contentInsetAdjustmentBehavior = .never
        view.register(TvingLargeCollectionView.self, forCellReuseIdentifier: TvingLargeCollectionView.identifier)
        view.register(TvingSmallCollectionView.self, forCellReuseIdentifier: TvingSmallCollectionView.identifier)
        return view
    }()
    
    // MARK: -  set
    
    override func setLayout() {
        
        addSubview(homeTableView)
        homeTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }

}
