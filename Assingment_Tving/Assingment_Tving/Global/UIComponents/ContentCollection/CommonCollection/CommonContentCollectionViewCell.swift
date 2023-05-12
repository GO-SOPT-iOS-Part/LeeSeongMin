//
//  TvingSmallCollectionViewCell.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/02.
//

import UIKit

final class CommonContentCollectionViewCell: BaseCollectionViewCell {
    
    static let identifier = "TvingSmallTableViewCell"
    
    enum Size {
        static let contentWidth: CGFloat = 100
        static let contentHeight: CGFloat = 100 / 0.7
    }
    
    // MARK: - properties
    
    private let mainContentView: UIView = {
        let view = UIView()
        view.setCornerRadius(to: 4)
        return view
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.text = "제목"
        label.textColor = .gray2
        label.font = .smallRegular
        return label
    }()
    
    // MARK: -  set
    
    override func setLayout() {
        contentView.addSubview(mainContentView)
        mainContentView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(Size.contentHeight)
        }
        
        contentView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview()
        }
    }
    
    // MARK: - configure
    
    func configureCell(_ color: DummyColor) {
        mainContentView.backgroundColor = color.color
    }
    
}
