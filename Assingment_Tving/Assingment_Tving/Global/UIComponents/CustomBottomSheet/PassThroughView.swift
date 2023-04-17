//
//  PassThroughView.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/15.
//

import UIKit

final class PassThroughView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(point, with: event)
        return hitView == self ? nil : hitView
    }
}
