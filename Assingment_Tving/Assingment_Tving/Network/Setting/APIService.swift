//
//  APIService.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/11.
//

import Foundation

class APIService {
    
}

extension APIService {
    
    func judgeStatus(by statusCode: Int, and data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200...299: return isValidData()
        }
    }
    
    func isValidData() {
        
    }
    
}
