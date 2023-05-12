//
//  ImageCacheManager.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/12.
//

import UIKit

final class ImageCacheManager {
    
    static let shared = NSCache<NSString, UIImage>()
    private init() {}
    
}
