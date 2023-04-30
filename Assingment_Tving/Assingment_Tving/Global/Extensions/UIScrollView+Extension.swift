//
//  UIScrollView+Extension.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/30.
//

import UIKit

extension UIScrollView {
    
    func scrollToLeft() {
        setContentOffset(.zero, animated: true)
    }
    
    func scrollToRight() {
        let offset = CGPoint(x: contentSize.width - SizeLiteral.Screen.width, y: 0)
        setContentOffset(offset, animated: true)
    }
}
