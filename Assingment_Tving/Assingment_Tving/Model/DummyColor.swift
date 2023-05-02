//
//  DummyColor.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/02.
//

import UIKit

struct DummyColor {
    let color: UIColor
}

extension DummyColor {
    static func dummy() -> [[DummyColor]] {
        return [
            [
                DummyColor(color: .systemGray),
                DummyColor(color: .systemGray2),
                DummyColor(color: .systemGray3),
                DummyColor(color: .systemGray4),
                DummyColor(color: .systemGray5)
            ],
            [
                DummyColor(color: .systemBlue),
                DummyColor(color: .systemCyan),
                DummyColor(color: .systemMint),
                DummyColor(color: .systemPink),
                DummyColor(color: .systemTeal)
            ]
        ]
    }
}
