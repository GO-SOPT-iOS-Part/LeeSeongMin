//
//  PageControlCollectionViewCell.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/28.
//

import UIKit

import SnapKit

final class PageControlCollectionViewCell: BaseCollectionViewCell {
    
    static let identifier = "PageControlCollectionViewCell"
    
    // MARK: - properties
    
    let baseCellView = UIView()
    
    let cellLabel: UILabel = {
        let label = UILabel()
        label.font = .bold
        label.textColor = .white
        return label
    }()
    
    // MARK: -  set
    
    override func setLayout() {
        contentView.addSubview(baseCellView)
        baseCellView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.addSubview(cellLabel)
        cellLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    // MARK: - configure
    
    func configureCell(_ text: String, _ color: UIColor) {
        baseCellView.backgroundColor = color
        cellLabel.text = text
    }

}
