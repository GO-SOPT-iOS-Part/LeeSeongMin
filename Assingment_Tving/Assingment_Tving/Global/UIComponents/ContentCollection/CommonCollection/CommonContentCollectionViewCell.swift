//
//  TvingSmallCollectionViewCell.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/02.
//

import UIKit

final class CommonContentCollectionViewCell: BaseCollectionViewCell {
    
    static let identifier = "TvingSmallTableViewCell"
    
    // MARK: - properties
    
    private let mainContentView: UIView = {
        let view = UIView()
        // FIXME: content 추가
        return view
    }()
    
    // MARK: -  set
    
    override func setLayout() {
        contentView.addSubview(mainContentView)
        mainContentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - configure
    
    func configureCell(_ color: DummyColor) {
        mainContentView.backgroundColor = color.color
    }
    
}
