//
//  TMDBModel.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/10.
//

import Foundation

struct MovieResponse: Codable {

    let page: Int
    let details: [MovieDetail]
    
    enum CodingKeys: String, CodingKey {
        case page
        case details = "results"
    }
    
}

struct MovieDetail: Codable {

    let id: Int
    let overview: String
    let posterPath: String
    let releaseDate: String
    let title: String

    enum CodingKeys: String, CodingKey {
        case id
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
    }

}

