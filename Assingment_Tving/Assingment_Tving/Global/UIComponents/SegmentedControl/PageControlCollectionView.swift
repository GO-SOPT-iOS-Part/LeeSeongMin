//
//  PageControlCollectionView.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/28.
//

import UIKit

final class PageControlCollectionView: UICollectionView {
    
    // MARK: - init
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        setCollectionView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -  set
    
    private func setCollectionView() {
        register(PageControlCollectionViewCell.self, forCellWithReuseIdentifier: Identifier.Collection.pageControl)
        isPagingEnabled = true
        
    }

}
