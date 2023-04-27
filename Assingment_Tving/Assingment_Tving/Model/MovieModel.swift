//
//  MovieModel.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/27.
//

import UIKit

struct Movie {
    let title: String
    let poster: UIImage
}

extension Movie {
    
    static func dummy() -> [Movie] {
        return [
            Movie(title: "비긴 어게인", poster: ImageLiteral.beginAgain),
            Movie(title: "비포 선셋", poster: ImageLiteral.beforeSunset),
            Movie(title: "어바웃 타임", poster: ImageLiteral.aboutTime),
            Movie(title: "어벤져스", poster: ImageLiteral.avengers),
            Movie(title: "업", poster: ImageLiteral.up),
            Movie(title: "인사이드 아웃", poster: ImageLiteral.insideOut),
            Movie(title: "해리포터와 불의 잔", poster: ImageLiteral.harryPotterGobletOfFire),
            Movie(title: "해리포터와 아즈카반의 죄수", poster: ImageLiteral.harryPotterAndThePrisoner),
        ]
    }
}
