//
//  HomeService.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/11.
//

import Foundation

import Alamofire

final class HomeAPIService: APIService, APIProtocol {
    
    static let shared = HomeAPIService()
    
    private override init() {}
    
}

extension HomeAPIService {
    
    func callAPI(of endpoint: any Endpointable) {
        let request = AF.request(Config.baseUrl + endpoint.path,
                                 method: endpoint.method,
                                 encoding: JSONEncoding.default,
                                 headers: endpoint.headers)
        request.responseData { response in
            dump(response.result)
        }
    }
    
    func callAPI(of endpoint: any Endpointable, with body: [String : Any]) {
        
    }
    
}
