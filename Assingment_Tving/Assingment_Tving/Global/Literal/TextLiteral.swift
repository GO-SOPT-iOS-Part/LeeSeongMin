//
//  TextLiteral.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/26.
//

import UIKit

enum TextLiteral {
    
    enum ConfigError {
        static let baseUrlError = "BASE_URL is not set in plist for this configuration."
        static let apiKeyError = "API_KEY is not set in plist for this configuration."
    }
    
    static let buyTicketButtonString = {
        let tvN = NSTextAttachment(image: ImageLiteral.tvN)
        let jtbc = NSTextAttachment(image: ImageLiteral.jtbc)
        let attributedString = NSMutableAttributedString()
        let lineHeightString = "다양한 영화 콘텐츠를 자유롭게 시청하세요!".setLineHeight(to: 20)
        attributedString.append(NSAttributedString(string: "이용권을 구매하고 "))
        attributedString.append(NSAttributedString(attachment: tvN))
        attributedString.append(NSAttributedString(string: " "))
        attributedString.append(NSAttributedString(attachment: jtbc))
        attributedString.append(NSAttributedString(string: " 등 인기 TV프로그램과\n"))
        attributedString.append(lineHeightString)
        return attributedString
    }()
}
