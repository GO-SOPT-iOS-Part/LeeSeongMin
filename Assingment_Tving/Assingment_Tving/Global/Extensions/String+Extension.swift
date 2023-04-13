//
//  String+Extension.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/14.
//

import Foundation

extension String {
    func isContainNumberAndAlphabet() -> Bool {
        let pattern = "^[0-9a-zA-Z]*$"
        guard let isContain = self.range(of: pattern, options: .regularExpression) else { return false}
        return true
    }
}
