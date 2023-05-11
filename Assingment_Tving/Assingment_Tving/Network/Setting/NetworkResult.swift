//
//  NetworkResult.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/11.
//

import Foundation

enum NetworkResult<T> {
    
    case success(T)
    case requestErr(T)
    case decodingErr
    case serverErr
    case networkErr
    case analysisError
    
}
