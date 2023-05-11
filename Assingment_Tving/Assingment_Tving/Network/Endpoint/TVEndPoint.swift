//
//  TVEndPoint.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/11.
//

import Foundation

import Alamofire

enum TVEndPoint<T: Codable>: Endpointable {
    
    case fetchPopular
    
    var path: String {
        switch self {
        case.fetchPopular: return "tv/popular"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchPopular: return .get
        }
    }
    
    var body: T? {
        switch self {
        case .fetchPopular: return nil
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .fetchPopular:
            return ["accept": "application/json",
                    "Authorization": "Bearer " + Config.apiKey]
        }
    }
    
}
