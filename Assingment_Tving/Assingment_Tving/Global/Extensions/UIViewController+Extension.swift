//
//  UIViewController+Extension.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/12.
//

import UIKit

extension UIViewController {
    
    // MARK: - navigation
    
    func makeNavigationBarButton<T: UIView>(with view: T) -> UIBarButtonItem {
        return UIBarButtonItem(customView: view)
    }
    
    func makeNavigationBarItemArea(with button: UIButton) -> UIView {
        let offsetView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        offsetView.addSubview(button)
        return offsetView
    }
    
    @objc
    func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - keyboard gesture
    
    func setKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(endEditing))
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
