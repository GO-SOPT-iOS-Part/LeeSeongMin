//
//  GalleryViewController.swift
//  Third_Seminar
//
//  Created by 이성민 on 2023/04/22.
//

import UIKit

final class GalleryViewController: UIViewController {
    
    private var dummy = PhotoModel.dummy() {
        didSet {
            galleryCollectionView.reloadData()
        }
    }
    
    // MARK: - properties
    
    private lazy var galleryCollectionView = GalleryCollectionView(frame: .zero, collectionViewLayout: flowLayout)
    private let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 6) / 3, height: (UIScreen.main.bounds.width - 6) / 3)
        layout.minimumLineSpacing = 3
        layout.minimumInteritemSpacing = 3
        return layout
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
        view.backgroundColor = .white
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
    
}


extension GalleryViewController: UICollectionViewDelegate {
    
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
        cell.configureCell(dummy[indexPath.row])
        
        cell.handler = { [weak self] in
            guard let self else { return }
            self.dummy[indexPath.row].favorite.toggle()
        }
        
        return cell
    }
}
