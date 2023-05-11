//
//  Config.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/10.
//

import Foundation

enum Config {
    
    enum Keys {
        enum Plist {
            static let baseUrl = "BASE_URL"
            static let apiKey = "API_KEY"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot found.")
        }
        return dict
    }()
    
}

extension Config {
    
    static let baseUrl: String = {
        guard let key = Config.infoDictionary[Keys.Plist.baseUrl] as? String
        else { fatalError(TextLiteral.ConfigError.baseUrlError) }
        return key
    }()
    
    static let apiKey: String = {
        guard let key = Config.infoDictionary[Keys.Plist.apiKey] as? String
        else { fatalError(TextLiteral.ConfigError.apiKeyError) }
        return key
    }()
    
}