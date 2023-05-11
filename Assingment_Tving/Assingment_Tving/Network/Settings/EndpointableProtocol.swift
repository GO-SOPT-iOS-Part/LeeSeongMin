//
//  EndpointableProtocol.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/10.
//

import Alamofire

protocol Endpointable {
    
    associatedtype T
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: String? { get }
    var body: T? { get }
    var header: HTTPHeaders? { get }
    
}
