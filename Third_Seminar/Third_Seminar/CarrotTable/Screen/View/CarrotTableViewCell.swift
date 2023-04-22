//
//  CarrotTableViewCell.swift
//  Third_Seminar
//
//  Created by 이성민 on 2023/04/22.
//

import UIKit

import SnapKit

final class CarrotTableViewCell: UITableViewCell {
    
    static let identifier = "CarrotTableViewCell"
    
    // MARK: - properties
    
    private let productImageView = UIImageView()
    
    private let productTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private let placeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private lazy var statusPriceStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [statusLabel, priceLabel])
        return view
    }()
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - life cycles
    
    
    // MARK: -  set
    
    private func setStyle() {
        
    }
    
    private func setLayout() {
        
    }

}
