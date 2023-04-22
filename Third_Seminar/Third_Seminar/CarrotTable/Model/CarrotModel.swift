//
//  CarrotModel.swift
//  Third_Seminar
//
//  Created by 이성민 on 2023/04/22.
//

import UIKit

struct CarrotModel {
    let image: UIImage
    let product: String
    let place: String
    let time: String
    let tradeStatus: TradeStatus
    let price: Int
}

@frozen
enum TradeStatus {
    case reserved
    case sold
    case shared
    case none
    
    var status: String {
        switch self {
        case .reserved:
            return "예약중"
        case .sold:
            return "거래 완료"
        case .shared:
            return "나눔 완료"
        case .none:
            return ""
        }
    }
    
    var backgroudColor: UIColor {
        switch self {
        case .reserved:
            return .systemGreen
        case .sold:
            return .black
        case .shared:
            return .systemGray
        case .none:
            return .clear
        }
    }
}

extension CarrotModel {
    
    static func dummy() -> [CarrotModel] {
        return [CarrotModel(image: .hypeBoy,
                       product: "에어팟 프로 2",
                       place: "하계 2동",
                       time: "일주일 전",
                       tradeStatus: .sold,
                       price: 200000),
                CarrotModel(image: .hypeBoy,
                       product:
                        "아이폰 11 Pro",
                       place: "하계 3동",
                       time: "4월 2일",
                       tradeStatus: .reserved,
                       price: 100000),
                CarrotModel(image: .hypeBoy,
                       product:
                        "에어팟 맥스",
                       place: "공릉 2동",
                       time: "1일 전",
                       tradeStatus: .shared,
                       price: 100000),
                CarrotModel(image: .hypeBoy,
                       product:
                        "아이패드1",
                       place: "공릉 1동",
                       time: "6시간 전",
                       tradeStatus: .sold,
                       price: 100000),
                CarrotModel(image: .hypeBoy,
                       product:
                        "아이패드 2",
                       place: "중계 2동",
                       time: "3시간 전",
                       tradeStatus: .none,
                       price: 100000),
                CarrotModel(image: .hypeBoy,
                       product:
                        "안팔아요",
                       place: "중계 2동",
                       time: "4월 3일",
                       tradeStatus: .sold,
                       price: 10000),
                CarrotModel(image: .hypeBoy,
                       product:
                        "아이폰 14 Pro",
                       place: "중계 2동",
                       time: "3월 31일",
                       tradeStatus: .reserved,
                       price: 1000)]
    }
}
