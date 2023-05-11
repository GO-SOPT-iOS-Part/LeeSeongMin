//
//  APIService.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/11.
//

import Foundation

import Alamofire

class APIService {
    
    typealias NetworkClosure = (NetworkResult<Any>) -> Void
    
}

extension APIService {
    
    func analyzeResponse<T: Decodable>(_ response: AFDataResponse<Data>,
                                       of type: T.Type) -> NetworkResult<Any> {
        guard let statusCode = response.response?.statusCode,
              let value = response.value
        else { return .networkErr }
        
        let decoder = JSONDecoder()
        
        switch statusCode {
        case 200...299, 300...399:
            guard let decodedData = try? decoder.decode(type, from: value)
            else { return .decodingErr }
            return .success(decodedData as Any)
            
        case 500...599:
            return .serverErr
            
        default:
            return .networkErr
        }
    }
    
    // api call without body
    func callAPI(of api: any RequestProtocol & ResponseProtocol, completion: @escaping NetworkClosure) {
        let request = AF.request(Config.baseUrl + api.path,
                                 method: api.method,
                                 encoding: JSONEncoding.default,
                                 headers: api.headers)
        request.responseData { response in
            switch response.result {
            case .success:
                completion(self.analyzeResponse(response, of: api.type))
            case .failure:
                completion(.networkErr)
            }
        }
    }
    
    // api call with body
    func callAPI(of endpoint: any RequestProtocol, with body: [String: Any], completion: @escaping NetworkClosure) {
        let request = AF.request(Config.baseUrl + endpoint.path,
                                 method: endpoint.method,
                                 parameters: body,
                                 encoding: JSONEncoding.default,
                                 headers: endpoint.headers)
        request.responseData { response in
            switch response.result {
            case .success:
                completion(self.analyzeResponse(response, of: MoviePopularResponse.self))
            case .failure:
                completion(.networkErr)
            }
        }
    }
    
}

//dataRequest.responseData { response in
//    switch response.result {
//    case .success:
//        guard let statusCode = response.response?.statusCode else { return }
//        guard let value = response.value else { return }
//        let networkResult = self.judgeStatus(by: statusCode, value)
//        completion(networkResult)
//
//    case .failure:
//        completion(.networkErr)
//    }
//}
//}
//
//private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
//switch statusCode {
//case 201: return isValidData(data: data)
//case 400, 409: return isValidData(data: data)
//case 500: return .serverErr
//default: return .networkErr
//}
//}
//
//private func isValidData(data: Data) -> NetworkResult<Any> {
//let decoder = JSONDecoder()
//
//guard let decodedData = try? decoder.decode(SignUpResponse.self, from: data) else { return .pathErr }
//
//return .success(decodedData as Any)
//}
//}
