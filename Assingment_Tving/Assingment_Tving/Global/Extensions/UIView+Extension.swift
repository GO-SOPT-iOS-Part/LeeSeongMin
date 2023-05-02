//
//  UIView+Extension.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/17.
//

import UIKit

extension UIView {
    
    func setCornerRadius(to radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func setBorder(color: UIColor, andWidth width: CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
    
    func setGradient(colors: [UIColor], position: [NSNumber]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = .axial
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.locations = position
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
//        self.layer.addSublayer(gradientLayer)
    }
}
