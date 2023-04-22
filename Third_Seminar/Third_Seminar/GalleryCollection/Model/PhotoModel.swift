//
//  PhotoModel.swift
//  Third_Seminar
//
//  Created by 이성민 on 2023/04/22.
//

import UIKit

struct PhotoModel {
    let image: UIImage
    var favorite: Bool
}

extension PhotoModel {
    static func dummy() -> [PhotoModel] {
        var photos: [PhotoModel] = []
        for number in 1...12 {
            photos.append(PhotoModel(image: UIImage(named: "photo_\(number)")!,
                                favorite: false))
        }
        return photos + photos
    }
}
