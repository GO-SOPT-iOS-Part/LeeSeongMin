//
//  UIViewController+Extension.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/12.
//

import UIKit

extension UIViewController {
    
    // MARK: - keyboard gesture
    
    func setKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        tap.cancelsTouchesInView = false
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    
    @objc
    private func endEditing() {
        view.endEditing(true)
    }
}

extension UIViewController: UIGestureRecognizerDelegate {
    
}
