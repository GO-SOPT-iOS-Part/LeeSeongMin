//
//  TvingLargeCollectionViewCell.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/02.
//

import UIKit

final class TvingLargeCollectionViewCell: BaseCollectionViewCell {
    
    static let identifier = "TvingLargeCollectionViewCell"
    
    // MARK: - properties
    
//    private let videoImageView: UIImageView = {
//        let view = UIImageView()
//        view.contentMode = .scaleAspectFit
//        return view
//    }()
    
    private let dummyView = UIView()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.textColor = .white1
        label.font = .regular
        return label
    }()
    
    // MARK: - init
    
    
    
    // MARK: -  set
    
    override func setLayout() {
        contentView.addSubview(dummyView)
        dummyView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(SizeLiteral.Common.sideMediumPadding)
        }
    }
    
    // MARK: - functions
    
//    func configureCell(_ image: UIImage, description: String) {
//        videoImageView.image = image
//        descriptionLabel.text = description
//    }
    
    func configureCell(_ color: DummyColor, description: String) {
        dummyView.backgroundColor = color.color
        descriptionLabel.text = description
    }

}
