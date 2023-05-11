//
//  NetworkResult.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/10.
//

import Foundation

enum NetworkResult<T> {
    
    case success(T)
    case requestError(T)
    case pathError
    case serverError
    case networkError
    
}
