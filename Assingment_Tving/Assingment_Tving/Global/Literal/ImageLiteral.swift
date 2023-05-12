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
    
    static let textfieldEye = UIImage.load(name: "textfieldEye").withRenderingMode(.alwaysTemplate)
    static let textfieldRemove = UIImage.load(name: "textfieldRemove").withRenderingMode(.alwaysTemplate)
    
    
    // MARK: - image
    
    static let mainPoster = UIImage.load(name: "mainPoster")
    static let profileImage = UIImage.load(name: "profileImage")
    static let tvN = UIImage.load(name: "tvN")
    static let jtbc = UIImage.load(name: "JTBC")
    
    
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
