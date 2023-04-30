//
//  ImageLiteral.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/12.
//

import UIKit

enum ImageLiteral {
    
    // MARK: - icon
    
    static let previous = UIImage(systemName: "chevron.left")
    static let next = UIImage(systemName: "chevron.right")
    static let notification = UIImage(systemName: "bell")
    static let setting = UIImage(systemName: "gearshape")
    static let ticket = UIImage(systemName: "ticket")
    static let cash = UIImage(systemName: "c.circle")
    static let liveTV = UIImage(systemName: "play.tv")
    
    static let textfieldEye = UIImage.load(name: "textfieldEye").withRenderingMode(.alwaysTemplate)
    static let textfieldRemove = UIImage.load(name: "textfieldRemove").withRenderingMode(.alwaysTemplate)
    
    
    // MARK: - image
    
    static let tvingPoster = UIImage.load(name: "tvingPoster")
    static let tvingLogo = UIImage.load(name: "tvingBanner")
    static let profileImage = UIImage.load(name: "profileImage")
    static let tvN = UIImage.load(name: "tvN")
    static let jtbc = UIImage.load(name: "JTBC")
    
    static let beginAgain = UIImage.load(name: "비긴어게인")
    static let beforeSunset = UIImage.load(name: "비포선셋")
    static let aboutTime = UIImage.load(name: "어바웃타임")
    static let avengers = UIImage.load(name: "어벤저스")
    static let up = UIImage.load(name: "업")
    static let insideOut = UIImage.load(name: "인사이드 아웃")
    static let harryPotterGobletOfFire = UIImage.load(name: "해리포터와 불의 잔")
    static let harryPotterAndThePrisoner = UIImage.load(name: "해리포터와 아즈카반의 죄수")
    
    
}

extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name) else {
            print("Image load failed: \(name)")
            return UIImage()
        }
        return image
    }
}
