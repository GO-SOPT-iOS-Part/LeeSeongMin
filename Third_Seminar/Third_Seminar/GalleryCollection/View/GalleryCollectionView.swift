//
//  GalleryCollectionView.swift
//  Third_Seminar
//
//  Created by 이성민 on 2023/04/24.
//

import UIKit

import SnapKit

final class GalleryCollectionView: UICollectionView {
    
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
        register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.identifier)
        showsVerticalScrollIndicator = false
    }
    
}
