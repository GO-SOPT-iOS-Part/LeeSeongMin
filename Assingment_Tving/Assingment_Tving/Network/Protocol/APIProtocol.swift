//
//  APIProtocol.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/12.
//

import Foundation

protocol APIProtocol {
    
    func callAPI(of endpoint: any Endpointable)
    func callAPI(of endpoint: any Endpointable, with body: [String: Any])
    
}
