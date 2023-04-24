//
//  CarrotTableView.swift
//  Third_Seminar
//
//  Created by 이성민 on 2023/04/22.
//

import UIKit

final class CarrotTableView: UITableView {
    
    // MARK: - properties
    
    
    // MARK: - init
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setTableView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("DEINIT: \(self)")
    }
    
    // MARK: - life cycles
    
    
    
    // MARK: -  set
    
    private func setTableView() {
        register(CarrotTableViewCell.self, forCellReuseIdentifier: CarrotTableViewCell.identifier)
        rowHeight = 120
    }

}
