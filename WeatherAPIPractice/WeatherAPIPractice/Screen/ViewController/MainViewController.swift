//
//  MainViewController.swift
//  WeatherAPIPractice
//
//  Created by 이성민 on 2023/05/06.
//

import UIKit

final class MainViewController: BaseViewController {
    
    // MARK: - properties
    
    
    
    // MARK: - life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchWeather()
    }
    
    // MARK: - set
    
    
    
    // MARK: - functions
    
    func fetchWeather() {
        
        WeatherService.shared.fetchWeatherData(of: "gongju") { response in
            switch response {
            case .success(let data):
                guard let data = data as? Weathers else { return }
                dump(data)
            default:
                return
            }
        }
    }
    
    // MARK: - objc functions
    

}
