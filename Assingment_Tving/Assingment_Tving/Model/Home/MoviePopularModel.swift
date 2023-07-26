//
//  MoviePopularModel.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/11.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

struct MoviePopularResponse: Codable {
    
    let page: Int
    let details: [MoviePopularResponseDetail]

    enum CodingKeys: String, CodingKey {
        case page
        case details = "results"
    }
}

struct MoviePopularResponseDetail: Codable {
    
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

//struct MoviePopularResponse: Codable {
//
//    let page: Int
//    let details: [MoviePopularResponseDetail]
//
//    enum CodingKyes: String, CodingKey {
//        case page
//        case details = "results"
//    }
//}
//
//// MARK: - Result
//struct MoviePopularResponseDetail: Codable {
//
//    let id: Int
//    let overview: String
//    let posterPath: String
//    let releaseDate: String
//    let title: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case overview
//        case posterPath = "poster_path"
//        case releaseDate = "release_date"
//        case title
//    }
//}
