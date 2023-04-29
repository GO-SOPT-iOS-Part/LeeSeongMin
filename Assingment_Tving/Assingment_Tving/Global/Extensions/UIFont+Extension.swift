//
//  UIFont+Extension.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/13.
//

import UIKit

extension UIFont {
    static func pretendardFont(_ weight: String, ofSize size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "Pretendard-" + weight, size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return customFont
    }
    
    static var title: UIFont {
        return pretendardFont("SemiBold", ofSize: 24)
    }
    
    static var bold: UIFont {
        return pretendardFont("Bold", ofSize: 15)
    }
    
    static var largeBold: UIFont {
        return pretendardFont("Bold", ofSize: 18)
    }
    
    static var regular: UIFont {
        return pretendardFont("Regular", ofSize: 15)
    }
    
    static var smallRegular: UIFont {
        return pretendardFont("Regular", ofSize: 12)
    }
}
