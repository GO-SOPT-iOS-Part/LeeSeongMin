//
//  TMDBService.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/10.
//

import Foundation

import Alamofire

final class MovieService: APIService<MovieResponse> {
    
    static let shared = MovieService()
    
    override init() {}
    
    func fetchMovieData(_ endpoint: MovieEndpoint<VoidModel>,
                        completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = Config.baseUrl + endpoint.path
        
        let request = AF.request(
            url,
            method: endpoint.method,
            encoding: JSONEncoding.default,
            headers: endpoint.header
        )
        
        request.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure:
                completion(.netwokrError)
            }
        }
    }
    
}
