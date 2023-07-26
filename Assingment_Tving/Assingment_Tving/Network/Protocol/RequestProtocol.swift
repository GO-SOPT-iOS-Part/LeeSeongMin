//
//  RequestProtocol.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/11.
//

import Alamofire

protocol RequestProtocol {
    
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    
}
