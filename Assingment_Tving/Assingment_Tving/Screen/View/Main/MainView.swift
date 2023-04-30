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
    
    let tvingBannerImageView: UIImageView = {
        let imageView = UIImageView(image: ImageLiteral.tvingLogo)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let profileButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.profileImage, for: .normal)
        button.imageView?.contentMode = .scaleToFill
        button.setCornerRadius(to: 4)
        return button
    }()
    
    let tvingBannerView = UIView()
    
    let segmentedButtonsView = SegmentedButtonsView()
    
//    lazy var pageControlCollectionView = PageControlCollectionView(frame: .zero, collectionViewLayout: flowLayout)
//
//    let flowLayout: UICollectionViewFlowLayout = {
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = .init(width: SizeLiteral.Screen.width, height: SizeLiteral.Screen.height)
//        layout.scrollDirection = .horizontal
//        layout.minimumLineSpacing = 0
//        return layout
//    }()
    
    
    
    // MARK: - init
    
    
    
    // MARK: -  set
    
    override func setLayout() {
        
//        addSubview(pageControlCollectionView)
//        pageControlCollectionView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
        
        addSubview(tvingBannerView)
        tvingBannerView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        tvingBannerView.addSubview(tvingBannerImageView)
        tvingBannerImageView.snp.makeConstraints {
            $0.leading.verticalEdges.equalToSuperview().inset(SizeLiteral.Common.sideSmallPadding)
            $0.height.equalTo(33)
        }
        
        tvingBannerView.addSubview(profileButton)
        profileButton.snp.makeConstraints {
            $0.trailing.verticalEdges.equalToSuperview().inset(SizeLiteral.Common.sideSmallPadding)
            $0.size.equalTo(33)
        }
        
        addSubview(segmentedButtonsView)
        segmentedButtonsView.snp.makeConstraints {
            $0.top.equalTo(tvingBannerView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(50)
        }
    }

}
