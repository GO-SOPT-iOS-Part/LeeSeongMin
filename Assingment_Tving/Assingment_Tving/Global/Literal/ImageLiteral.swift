//
//  ImageLiteral.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/12.
//

import UIKit

enum ImageLiteral {
    
    // MARK: - main
    
    static let mainPoster = UIImage.load(name: "mainPoster")
    
    // MARK: - navigation
    
    static let navigationBack = UIImage.load(name: "navigationBack")
    
    // MARK: - textfield
    
    static let textfieldEye = UIImage.load(name: "textfieldEye").withRenderingMode(.alwaysTemplate)
    static let textfieldRemove = UIImage.load(name: "textfieldRemove").withRenderingMode(.alwaysTemplate)
}

extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name) else { return UIImage() }
        return image
    }
}
