//
//  CarrotViewController.swift
//  Third_Seminar
//
//  Created by 이성민 on 2023/04/22.
//

import UIKit

import SnapKit

final class CarrotViewController: UIViewController {
    
    let dummy = CarrotModel.dummy()
    
    // MARK: - properties
    
    private let carrotTableView = CarrotTableView()
    
    // MARK: - life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
        setDelegate()
    }
    
    // MARK: - set
    
    private func setStyle() {
        
    }
    
    private func setLayout() {
        view.addSubview(carrotTableView)
        carrotTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        carrotTableView.delegate = self
        carrotTableView.dataSource = self
    }
    
    // MARK: - functions
    
    
    
    // MARK: - objc functions
    

}

extension CarrotViewController: UITableViewDelegate {
    
}

extension CarrotViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarrotTableViewCell.identifier) as? CarrotTableViewCell else { return UITableViewCell() }
        cell.configureCell(dummy[indexPath.row])
        return cell
    }
}
