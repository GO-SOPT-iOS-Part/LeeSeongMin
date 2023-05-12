//
//  TvingLargeCollectionViewCell.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/02.
//

import UIKit

final class LargeContentCollectionViewCell: BaseCollectionViewCell {
    
    enum Size {
        static let cellHeight = SizeLiteral.Screen.width / 0.7
        static let cellWidth = SizeLiteral.Screen.width
    }
    
    static let identifier = "LargeContentCollectionViewCell"
    
    // MARK: - properties
    
    private let posterView = UIImageView()
    
    private let bottomGradientView = UIView()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.textColor = .white1
        label.font = .regular
        return label
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutIfNeeded()
    }
    
    // MARK: -  set
    
    override func setLayout() {
        contentView.addSubview(posterView)
        posterView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.addSubview(bottomGradientView)
        bottomGradientView.snp.makeConstraints {
            $0.bottom.horizontalEdges.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        bottomGradientView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(40)
        }
    }
    
    // MARK: - functions
    
    func configureCell(_ color: DummyColor, description: String) {
        posterView.backgroundColor = color.color
        descriptionLabel.text = description
        bottomGradientView.setGradient(colors: [.black1, .clear], position: [0, 1])
    }
    
    func configureCell(_ data: MoviePopularResponseDetail) {
        guard let posterPath = URL(string: Config.imageBaseUrl + data.posterPath)
        else { return }
        let posterSize = CGSize(width: Size.cellWidth, height: Size.cellHeight)
        let posterScale = UIScreen.main.scale
        
        posterView.image = downsample(imageAt: posterPath, to: posterSize, scale: posterScale)
        descriptionLabel.text = data.title
        bottomGradientView.setGradient(colors: [.black1, .clear], position: [0, 1])
    }
    
}
