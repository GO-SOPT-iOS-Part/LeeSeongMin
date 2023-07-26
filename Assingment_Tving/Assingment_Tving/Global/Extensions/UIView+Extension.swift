//
//  UIView+Extension.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/17.
//

import UIKit

extension UIView {
    
    func setCornerRadius(to radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func setBorder(color: UIColor, andWidth width: CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
    
    func setGradient(colors: [UIColor], position: [NSNumber]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.name = "gradient"
        gradientLayer.type = .axial
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.locations = position
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        gradientLayer.frame = self.bounds
        
        guard let sublayers = self.layer.sublayers else { return }
        if sublayers.filter({ $0.name == "gradient" }).isEmpty {
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
    
    // MARK: - image downsample
    
    func downsample(imageAt imageURL: URL, to pointSize: CGSize, scale: CGFloat) -> UIImage {
        
        let cacheKey = NSString(string: imageURL.absoluteString)
        if let cachedImage = ImageCacheManager.shared.object(forKey: cacheKey) {
            return cachedImage
        }
        
        let imageSourceOptions = [kCGImageSourceShouldCache: false] as CFDictionary
        guard let imageSource = CGImageSourceCreateWithURL(imageURL as CFURL, imageSourceOptions)
        else { return UIImage() }

        let maxDimensionInPixels = max(pointSize.width, pointSize.height) * scale
        let downsampleOptions = [
            kCGImageSourceCreateThumbnailFromImageAlways: true,
            kCGImageSourceShouldCacheImmediately: true,
            kCGImageSourceCreateThumbnailWithTransform: true,
            kCGImageSourceThumbnailMaxPixelSize: maxDimensionInPixels
        ] as [CFString: Any] as CFDictionary

        guard let downsampledCGImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, downsampleOptions)
        else { return UIImage() }
        let downsampledImage = UIImage(cgImage: downsampledCGImage)
        
        ImageCacheManager.shared.setObject(downsampledImage, forKey: cacheKey)
        
        return downsampledImage
    }
}
