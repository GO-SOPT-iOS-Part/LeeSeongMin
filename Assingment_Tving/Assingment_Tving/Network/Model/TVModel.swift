//
//  TVModel.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/10.
//

import Foundation

struct TVResponse: Codable {
    
    let page: Int
    let details: [Result]

    enum CodingKeys: String, CodingKey {
        case page
        case details = "results"
    }
    
}

struct Result: Codable {
    
    let firstAirDate: String
    let id: Int
    let name: String
    let overview: String
    let posterPath: String

    enum CodingKeys: String, CodingKey {
        case firstAirDate = "first_air_date"
        case id, name
        case overview
        case posterPath = "poster_path"
    }
    
}
