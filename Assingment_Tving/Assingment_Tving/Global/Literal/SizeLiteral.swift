//
//  SizeLiteral.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/26.
//

import UIKit

enum SizeLiteral {
    
    enum Common {
        static let sidePadding = 20
        static let sideMediumPadding = 14
        static let sideSmallPadding = 10
    }
    
    enum Screen {
        static let width = UIScreen.main.bounds.width
        static let height = UIScreen.main.bounds.height
    }
    
    enum Button {
        static let height: CGFloat = 52
    }
    
}
