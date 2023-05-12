//
//  String+Extension.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/14.
//

import UIKit

extension String {
    func isOnlyKorean() -> Bool {
        let pattern = "^[가-힣ㄱ-ㅎㅏ-ㅣ]+$"
        guard self.range(of: pattern, options: .regularExpression) != nil else { return false }
        return true
    }
    
    func setLineHeight(to height: CGFloat) -> NSAttributedString {
        let style = NSMutableParagraphStyle()
        style.maximumLineHeight = height
        style.minimumLineHeight = height
        
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: style,
        ]
        
        let attributedString = NSAttributedString(string: self, attributes: attributes)
        
        return attributedString
    }
    
    func setAttrubutedString(with icon: UIImage) -> NSMutableAttributedString {
        let image = NSTextAttachment(image: icon)
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(attachment: image))
        attributedString.append(NSAttributedString(string: self))
        return attributedString
    }
}
