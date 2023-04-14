//
//  UIFont+Extension.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/13.
//

import UIKit

extension UIFont {
    static func font(_ weight: String, ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Pretendard-" + weight, size: size)!
    }
    
    static var title: UIFont {
        return font("SemiBold", ofSize: 24)
    }
    
    static var bold: UIFont {
        return font("Bold", ofSize: 15)
    }
    
    static var regular: UIFont {
        return font("Regular", ofSize: 15)
    }
    
    static var smallRegular: UIFont {
        return font("Regular", ofSize: 12)
    }
    
//    static var thin: UIFont {
//        return font("Thin", ofSize: 15)
//    }
}
