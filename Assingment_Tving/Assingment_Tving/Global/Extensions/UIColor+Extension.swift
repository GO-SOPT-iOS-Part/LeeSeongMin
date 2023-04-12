//
//  UIColor+Extension.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/12.
//

import UIKit

extension UIColor {
    
    // MARK: - red(main)
    
    static let red1 = UIColor(hex: "#FF143C")
    
    // MARK: - white
    
    static let white1 = UIColor(hex: "#FFFFFF")
    
    // MARK: - black
    
    static let black1 = UIColor(hex: "#000000")
    
    // MARK: - gray
    
    static let gray1 = UIColor(hex: "#D6D6D6")
    static let gray2 = UIColor(hex: "#9C9C9C")
    static let gray3 = UIColor(hex: "#626262")
    static let gray4 = UIColor(hex: "#2E2E2E")
}


// MARK: - extension

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}
