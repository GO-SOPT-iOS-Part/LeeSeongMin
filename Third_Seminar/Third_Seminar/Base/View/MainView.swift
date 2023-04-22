//
//  MainView.swift
//  Third_Seminar
//
//  Created by 이성민 on 2023/04/22.
//

import UIKit

import SnapKit

final class MainView: UIView {
    
    // MARK: - properties
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.textColor = .black
        return label
    }()
    
    let textfield: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "뭐사가"
        return textfield
    }()
    
    // MARK: - life cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - set
    
    private func setStyle() {
        backgroundColor = .white
    }
    
    private func setLayout() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide)
        }
        
        addSubview(textfield)
        textfield.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }
    
    // MARK: - functions
    
    
    
    // MARK: - objc functions
    

}
