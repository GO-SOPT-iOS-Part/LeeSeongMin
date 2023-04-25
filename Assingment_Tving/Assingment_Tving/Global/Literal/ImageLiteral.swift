//
//  ImageLiteral.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/12.
//

import UIKit

enum ImageLiteral {
    
    // MARK: components
    // MARK: - main
    
    static let mainPoster = UIImage.load(name: "mainPoster")
    
    // MARK: - navigation
    
    static let navigationBack = UIImage.load(name: "navigationBack")
    
    // MARK: - textfield
    
    static let textfieldEye = UIImage.load(name: "textfieldEye").withRenderingMode(.alwaysTemplate)
    static let textfieldRemove = UIImage.load(name: "textfieldRemove").withRenderingMode(.alwaysTemplate)
    
    
    // MARK: views
    // MARK: - mypage
    
    static let profileImage = UIImage.load(name: "profileImage")
    
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
