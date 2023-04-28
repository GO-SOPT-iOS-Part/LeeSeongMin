//
//  MainView.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/26.
//

import UIKit

import SnapKit

final class MainView: BaseView {
    
    // MARK: - properties
    
    lazy var segmentedButtonsView = SegmentedButtonsView()
    
    lazy var pageControlCollectionView = PageControlCollectionView(frame: .zero, collectionViewLayout: flowLayout)

    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: SizeLiteral.Screen.width, height: SizeLiteral.Screen.height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        return layout
    }()
    
//    let pageControl = UIPageControl()
    
    // MARK: - init
    
    
    
    // MARK: -  set
    
    override func setLayout() {
        addSubview(pageControlCollectionView)
        pageControlCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        addSubview(segmentedButtonsView)
        segmentedButtonsView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(50)
        }
    }

}
