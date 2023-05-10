//
//  APIService.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/10.
//

import Foundation

class APIService<T: Codable> {
    
    func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200...299: return decodeValidData(data)
        case 400...499: return decodeValidData(data)
        case 500...599: return .serverError
        default: return .netwokrError
        }
    }
    
    func decodeValidData(_ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data)
        else { return .pathError }
        
        return .success(decodedData as Any)
    }
    
}
