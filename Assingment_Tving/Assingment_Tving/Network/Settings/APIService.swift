//
//  APIService.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/10.
//

import UIKit
import CoreGraphics

import Alamofire

class APIService<T: Codable> {
    
}

extension APIService {
    
    func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200...299: return decodeValidData(data)
        case 400...499: return decodeValidData(data)
        case 500...599: return .serverError
        default: return .networkError
        }
    }
    
    func decodeValidData(_ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data)
        else { return .pathError }
        
        return .success(decodedData as Any)
    }
    
    func analyzeNetworkResult(from response: AFDataResponse<Data>) -> NetworkResult<Any> {
        guard let statusCode = response.response?.statusCode,
              let value = response.value
        else { return .pathError }
        let networkResult = self.judgeStatus(by: statusCode, value)
        
        return networkResult
    }
    
    func downsample(imageAt imageURL: URL, to pointSize: CGSize, scale: CGFloat) -> UIImage {
        let imageSourceOptions = [kCGImageSourceShouldCache: false] as CFDictionary
        let imageSource = CGImageSourceCreateWithURL(imageURL as CFURL, imageSourceOptions)!

        let maxDimensionInPixels = max(pointSize.width, pointSize.height) * scale
        let downsampleOptions = [
            kCGImageSourceCreateThumbnailFromImageAlways: true,
            kCGImageSourceShouldCacheImmediately: true,
            kCGImageSourceCreateThumbnailWithTransform: true,
            kCGImageSourceThumbnailMaxPixelSize: maxDimensionInPixels
        ] as [CFString: Any] as CFDictionary

        let downsampledImage = CGImageSourceCreateThumbnailAtIndex(
            imageSource, 0, downsampleOptions
        )!
        return UIImage(cgImage: downsampledImage)
    }
    
}
