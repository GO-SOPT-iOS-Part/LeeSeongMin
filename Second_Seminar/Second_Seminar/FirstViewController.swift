//
//  FirstViewController.swift
//  Second_Seminar
//
//  Created by 이성민 on 2023/04/08.
//

import UIKit

import SnapKit
import Then

final class FirstViewController: UIViewController {
    
    var numberPressed: Int = 0
    
    // MARK: - properties
    
    private lazy var numberPressedLabel: UILabel = {
        let label = UILabel()
        label.text = "쉿?"
        label.textColor = .systemCyan
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.layer.cornerRadius = 20
        label.layer.masksToBounds = true
        return label
    }()
    
    private let pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("쉿정하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(pushToSecondVC), for: .touchUpInside)
        return button
    }()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setStyle()
    }
    
    // MARK: - functions
    
    private func checkNumberPressed() {
        if numberPressed >= 10 {
            numberPressedLabel.text = "쉿! \(numberPressed)쉿!"
        } else {
            numberPressedLabel.text = "\(numberPressed)쉿"
        }
    }
    
    // MARK: - objc functions
    
    @objc
    private func pushToSecondVC() {
        let secondViewController = SecondViewController()
        secondViewController.delegate = self
        self.present(secondViewController, animated: true)
    }
}

private extension FirstViewController {
    private func setLayout() {
        view.addSubview(numberPressedLabel)
        numberPressedLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(50)
            $0.height.equalTo(40)
        }
        
        view.addSubview(pushButton)
        pushButton.snp.makeConstraints {
            $0.top.equalTo(numberPressedLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(50)
            $0.height.equalTo(40)
        }
    }
    
    private func setStyle() {
        view.backgroundColor = .white
    }
}

extension FirstViewController: ControlNumberDelegate {
    func plusNumber() {
        numberPressed += 1
        checkNumberPressed()
    }
    
    func minusNumber() {
        numberPressed -= 1
        checkNumberPressed()
    }
}
