//
//  TVService.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/11.
//

import Foundation

import Alamofire

final class TVService: APIService<TVResponse> {
    
    static let shared = TVService()
    
    override init() {}
    
    func fetchTVData(_ endpoint: TVEndPoint<VoidModel>, completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = Config.baseUrl + endpoint.path
        
        let request = AF.request(url,
                                 method: endpoint.method,
                                 encoding: JSONEncoding.default,
                                 headers: endpoint.header)
        
        request.responseData { response in
            switch response.result {
            case .success:
                completion(self.analyzeNetworkResult(from: response))
                
            case .failure:
                completion(.networkError)
            }
        }
    }
    
}
