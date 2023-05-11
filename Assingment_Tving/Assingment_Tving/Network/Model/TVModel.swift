//
//  TVModel.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/10.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct TVResponse: Codable {
    
    let page: Int
    let details: [Result]

    enum CodingKeys: String, CodingKey {
        case page
        case details = "results"
    }
    
}

// MARK: - Result
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
