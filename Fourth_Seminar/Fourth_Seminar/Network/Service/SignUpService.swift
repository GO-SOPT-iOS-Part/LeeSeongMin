//
//  SignUpService.swift
//  Fourth_Seminar
//
//  Created by 이성민 on 2023/05/06.
//

import Foundation

import Alamofire

final class SignUpService {
    
    static let shared = SignUpService()
    
    private init() {}
    
    func signUp(email: String,
                nickname: String,
                password: String,
                completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = Config.baseURL + "/user/signup"
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        let body: Parameters = [
            "email": email,
            "nickname": nickname,
            "password": password,
        ]
        
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure:
                completion(.networkErr)
            }
        }
    }
    
    func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 201: return isValidData(data: data)
        case 400, 409: return isValidData(data: data)
        case 500: return .serverErr
        default: return .networkErr
        }
    }
    
    func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(SignUpResponse.self, from: data) else { return .pathErr}
        
        return .success(decodedData as Any)
    }
}
