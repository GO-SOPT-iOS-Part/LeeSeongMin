//
//  HomeEndpoint.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/11.
//

import Foundation

import Alamofire

enum HomeEndpoint<T: Codable>: RequestProtocol, ResponseProtocol {
    
    case fetchMoviePopular
    case fetchTVPopular
    
    // MARK: - RequestProtocol
    
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
    
    // MARK: - ResponseProtocol
    
    var type: T.Type {
        switch self {
        case .fetchMoviePopular: return T.self
        case .fetchTVPopular: return T.self
        }
    }
    
}
