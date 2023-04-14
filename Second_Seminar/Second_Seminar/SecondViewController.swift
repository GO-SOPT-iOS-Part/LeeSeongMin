//
//  SecondViewController.swift
//  Second_Seminar
//
//  Created by 이성민 on 2023/04/08.
//

import UIKit

import SnapKit

protocol ControlNumberDelegate: AnyObject {
    func plusNumber()
    func minusNumber()
}

final class SecondViewController: UIViewController {
    
    weak var delegate: ControlNumberDelegate?
    
    // MARK: - properties
    
    private let containerView = UIView()
    
    private let plusButton: UIButton = {
        let button = UIButton()
        button.setTitle("쉿하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("쉿기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(minusButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let dismissButton: UIButton = {
        let button = UIButton()
        button.setTitle("닫기", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)
        return button
    }()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setStyle()
    }
    
    // MARK: - functions
    
    // MARK: - objc functions
    
    @objc
    private func plusButtonPressed() {
        delegate?.plusNumber()
    }
    
    @objc
    private func minusButtonPressed() {
        delegate?.minusNumber()
    }
    
    @objc
    private func dismissModal() {
        self.dismiss(animated: true)
    }
    
}

private extension SecondViewController {
    private func setLayout() {
        view.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(140)
            $0.height.equalTo(60)
        }
        
        containerView.addSubview(plusButton)
        plusButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.verticalEdges.equalToSuperview()
            $0.width.equalTo(60)
        }
        
        containerView.addSubview(minusButton)
        minusButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.verticalEdges.equalToSuperview()
            $0.width.equalTo(60)
        }
        
        view.addSubview(dismissButton)
        dismissButton.snp.makeConstraints {
            $0.top.equalTo(containerView.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func setStyle() {
        view.backgroundColor = .white
    }
}
