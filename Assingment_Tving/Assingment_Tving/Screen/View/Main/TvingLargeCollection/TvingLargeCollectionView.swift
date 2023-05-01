//
//  TvingLargeCollectionView.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/02.
//

import UIKit

final class TvingLargeCollectionView: BaseTableViewCell {
    
    static let identifier = "TvingLargeCollectionView"
    static let cellHeight = 400
    
    // MARK: - properties
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "dummy"
        label.textColor = .white1
        label.font = .largeBold
        return label
    }()
    
    // MARK: -  set
    
    override func setLayout() {
        addSubview(label)
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
}
