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
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let placeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var statusPriceStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [statusLabel, priceLabel])
        view.alignment = .leading
        view.spacing = 4
        return view
    }()
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -  set
    
    private func setStyle() {
        
    }
    
    private func setLayout() {
        contentView.addSubview(productImageView)
        productImageView.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
        }
        
        contentView.addSubview(productTitle)
        productTitle.snp.makeConstraints {
            $0.leading.equalTo(productImageView.snp.trailing).offset(14)
            $0.top.equalToSuperview().inset(14)
        }
        
        contentView.addSubview(placeLabel)
        placeLabel.snp.makeConstraints {
            $0.leading.equalTo(productTitle)
            $0.top.equalTo(productTitle.snp.bottom).offset(6)
        }
        
        contentView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints {
            $0.leading.equalTo(productTitle)
            $0.top.equalTo(placeLabel.snp.bottom).offset(4)
        }
        
        priceLabel.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.width.equalTo(70)
        }
        
        statusLabel.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.width.equalTo(50)
        }
        
        contentView.addSubview(statusPriceStackView)
        statusPriceStackView.snp.makeConstraints {
            $0.leading.equalTo(productTitle)
            $0.top.equalTo(timeLabel.snp.bottom).offset(6)
            $0.height.equalTo(30)
        }
    }
    
    // MARK: - configure
    
    func configureCell(_ carrot: CarrotModel) {
        productImageView.image = carrot.image
        productTitle.text = carrot.product
        placeLabel.text = carrot.place
        timeLabel.text = carrot.time
        
        if carrot.tradeStatus == .none {
            statusLabel.isHidden = true
        } else {
            statusLabel.text = carrot.tradeStatus.status
        }
        statusLabel.backgroundColor = carrot.tradeStatus.backgroudColor
        
        var price = String(carrot.price)
        price.insert(",", at: price.index(price.endIndex, offsetBy: -3))
        priceLabel.text = price + "원"
    }

}
