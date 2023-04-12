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
    
    static var bold: UIFont {
        return font("bold", ofSize: 15)
    }
    
    static var regular: UIFont {
        return font("Regular", ofSize: 15)
    }
    
//    static var thin: UIFont {
//        return font("Thin", ofSize: 15)
//    }
}
