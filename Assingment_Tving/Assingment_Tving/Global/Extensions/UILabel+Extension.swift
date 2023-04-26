//
//  UILabel+Extension.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/26.
//

import UIKit

extension UILabel {
    func setLineHeight(to height: CGFloat) {
        guard let text else { return }
        let style = NSMutableParagraphStyle()
        style.maximumLineHeight = height
        style.minimumLineHeight = height
        
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: style,
            .baselineOffset: (height - font.lineHeight) / 2 + font.descender
        ]
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        
        self.attributedText = attributedString
    }
}
