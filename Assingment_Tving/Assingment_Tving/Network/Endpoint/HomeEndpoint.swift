//
//  HomeEndpoint.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/11.
//

import Foundation

import Alamofire

enum HomeEndpoint<T: Codable>: Endpointable {
    
    case fetchMoviePopular
    case fetchTVPopular
    
    var path: String {
        switch self {
        case .fetchMoviePopular: return "movie/popular"
        case .fetchTVPopular: return "tv/popular"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchMoviePopular: return .get
        case .fetchTVPopular: return .get
        }
    }
    
    var body: T? {
        switch self {
        case .fetchMoviePopular: return nil
        case .fetchTVPopular: return nil
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .fetchMoviePopular:
            return ["accept": "application/json",
                    "Authorization": "Bearer " + Config.apiKey]
        case .fetchTVPopular:
            return ["accept": "application/json",
                    "Authorization": "Bearer " + Config.apiKey]
        }
    }
    
}
