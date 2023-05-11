//
//  Endpointable.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/11.
//

import Alamofire

protocol Endpointable {
    
    associatedtype T
    var path: String { get }
    var method: HTTPMethod { get }
    var body: T? { get }
    var headers: HTTPHeaders? { get }
    
}
