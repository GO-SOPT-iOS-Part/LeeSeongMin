//
//  APIProtocol.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/12.
//

import Foundation

protocol APIServiceProtocol {
    
    typealias NetworkClosure = (NetworkResult<Any>) -> Void
    
    func callAPI(of endpoint: any RequestProtocol, completion: @escaping NetworkClosure)
    func callAPI(of endpoint: any RequestProtocol, with body: [String: Any], completion: @escaping NetworkClosure)
    
}
