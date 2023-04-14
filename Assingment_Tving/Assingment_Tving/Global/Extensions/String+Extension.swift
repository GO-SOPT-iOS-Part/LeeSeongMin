//
//  String+Extension.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/14.
//

import Foundation

extension String {
    func isOnlyKorean() -> Bool {
        let pattern = "[가-힣ㄱ-ㅎㅏ-ㅣ]$"
        guard self.range(of: pattern, options: .regularExpression) != nil else { return false }
        return true
    }
}
