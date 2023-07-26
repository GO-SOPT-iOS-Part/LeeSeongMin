//
//  ResponseProtocol.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/12.
//

import Foundation

protocol ResponseProtocol {
    
    associatedtype T: Codable
    var type: T.Type { get }
    
}
