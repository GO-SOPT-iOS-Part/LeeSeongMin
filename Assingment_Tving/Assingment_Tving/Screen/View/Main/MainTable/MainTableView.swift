//
//  MainTableView.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/02.
//

import UIKit

final class MainTableView: UITableView {
    
    // MARK: - properties
    
    
    
    // MARK: - init
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: style)
        
        setTableView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -  set
    
    private func setTableView() {
        backgroundColor = .clear
        separatorStyle = .none
        showsVerticalScrollIndicator = false
        register(TvingLargeCollectionView.self, forCellReuseIdentifier: TvingLargeCollectionView.identifier)
        register(TvingSmallCollectionView.self, forCellReuseIdentifier: TvingSmallCollectionView.identifier)
    }
    
}
