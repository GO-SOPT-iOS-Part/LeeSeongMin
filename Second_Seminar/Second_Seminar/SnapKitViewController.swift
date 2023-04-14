//
//  SnapKitViewController.swift
//  Second_Seminar
//
//  Created by 이성민 on 2023/04/08.
//

import UIKit

import SnapKit

final class SnapKitViewController: UIViewController {
    
    let viewColors: [UIColor] = [.systemRed, .systemBlue, .systemCyan, .systemMint]
    
    // MARK: - properties
    
    private lazy var firstView: UIView = {
        let view = UIView()
        view.backgroundColor = viewColors[Int.random(in: 0...3)]
        return view
    }()
    
    private lazy var secondView: UIView = {
        let view = UIView()
        view.backgroundColor = viewColors[Int.random(in: 0...3)]
        return view
    }()
    
    private lazy var thirdView: UIView = {
        let view = UIView()
        view.backgroundColor = viewColors[Int.random(in: 0...3)]
        return view
    }()
    
    private lazy var fourthView: UIView = {
        let view = UIView()
        view.backgroundColor = viewColors[Int.random(in: 0...3)]
        return view
    }()
    
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
}

private extension SnapKitViewController {
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubview(firstView)
        firstView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.trailing.equalTo(view.snp.centerX)
            $0.height.equalTo(view.frame.height / 4)
        }
        
        view.addSubview(secondView)
        secondView.snp.makeConstraints {
            $0.top.equalTo(firstView.snp.bottom)
            $0.leading.equalTo(view.snp.centerX)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(view.frame.height / 4)
        }
        
        view.addSubview(thirdView)
        thirdView.snp.makeConstraints {
            $0.top.equalTo(secondView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(view.snp.centerX)
            $0.height.equalTo(view.frame.height / 4)
        }
        
        view.addSubview(fourthView)
        fourthView.snp.makeConstraints {
            $0.top.equalTo(thirdView.snp.bottom)
            $0.leading.equalTo(view.snp.centerX)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(view.frame.height / 4)
        }
    }
}
