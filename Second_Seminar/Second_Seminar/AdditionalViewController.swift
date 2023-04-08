//
//  AdditionalViewController.swift
//  Second_Seminar
//
//  Created by 이성민 on 2023/04/08.
//

import UIKit

import SnapKit

final class AdditionalViewController: UIViewController {
    
    // MARK: - properties
    
    private let modalPresentButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(presentModal), for: .touchUpInside)
        return button
    }()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
    
    // MARK: - objc func
    
    @objc
    private func presentModal() {
        let modalView = SnapKitViewController()
        if let sheet = modalView.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.delegate = self
            sheet.prefersGrabberVisible = true
        }
        present(modalView, animated: true)
    }
    
}

private extension AdditionalViewController {
    private func setStyle() {
        
    }
    
    private func setLayout() {
        view.addSubview(modalPresentButton)
        modalPresentButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(60)
        }
    }
}

extension AdditionalViewController: UISheetPresentationControllerDelegate {
    
}
