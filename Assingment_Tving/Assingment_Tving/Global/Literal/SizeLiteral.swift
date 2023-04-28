//
//  SizeLiteral.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/26.
//

import UIKit

enum SizeLiteral {
    
    enum Common {
        static let sidePadding: CGFloat = 20
        static let sideMediumPadding: CGFloat = 14
        static let sideSmallPadding: CGFloat = 10
    }
    
    enum Screen {
        static let width = UIScreen.main.bounds.width
        static let height = UIScreen.main.bounds.height
    }
    
    enum Button {
        static let height: CGFloat = 52
        static let iconButtonFrame: CGRect = .init(x: 0, y: 0, width: 30, height: 44)
    }
    
}
