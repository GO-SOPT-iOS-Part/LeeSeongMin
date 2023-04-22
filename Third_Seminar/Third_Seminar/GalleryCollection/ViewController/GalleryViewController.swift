//
//  GalleryViewController.swift
//  Third_Seminar
//
//  Created by 이성민 on 2023/04/22.
//

import UIKit

final class GalleryViewController: UIViewController {
    
    private var dummy = PhotoModel.dummy()
    
    // MARK: - properties
    
    private lazy var galleryCollectionView: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.register(
            GalleryCollectionViewCell.self,
            forCellWithReuseIdentifier: GalleryCollectionViewCell.identifier
        )
        collectionView.collectionViewLayout = flowLayout
        collectionView.showsVerticalScrollIndicator = false
        
        return collectionView
    }()
    
    private let flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(
            width: (UIScreen.main.bounds.width - 6) / 3,
            height: (UIScreen.main.bounds.width - 6) / 3
        )
        flowLayout.minimumLineSpacing = 3
        flowLayout.minimumInteritemSpacing = 3
        return flowLayout
    }()
    
    // MARK: - life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
        setDelegate()
    }
    
    // MARK: - set
    
    private func setStyle() {
        
    }
    
    private func setLayout() {
        view.addSubview(galleryCollectionView)
        galleryCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
    }
    
    // MARK: - functions
    
    
    
    // MARK: - objc functions
    

}


extension GalleryViewController: UICollectionViewDelegate {
    
}

extension GalleryViewController: UICollectionViewFlowLayout {
    
}

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: GalleryCollectionViewCell.identifier,
            for: indexPath
        ) as? GalleryCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
}
