//
//  GalleryCollectionViewCell.swift
//  Third_Seminar
//
//  Created by 이성민 on 2023/04/22.
//

import UIKit

final class GalleryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PhotoCell"
    
    var isTapped: Bool = false {
        didSet {
            updateButton()
        }
    }
    
    var handler: (() -> Void)?
    
    // MARK: - properties
    
    let photoImage = UIImageView()
    lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -  set
    
    func setLayout() {
        
        contentView.addSubview(photoImage)
        photoImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.addSubview(favoriteButton)
        favoriteButton.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview().inset(5)
            $0.size.equalTo(30)
        }
    }
    
    // MARK: - configure
    
    func configureCell(_ photo: PhotoModel) {
        photoImage.image = photo.image
        isTapped = photo.favorite
    }
    
    // MARK: - function
    
    func updateButton() {
        let imageName = isTapped ? "heart.fill" : "heart"
        favoriteButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    // MARK: - objc function
    
    @objc
    func favoriteButtonTapped() {
        handler?()
    }
    
}
