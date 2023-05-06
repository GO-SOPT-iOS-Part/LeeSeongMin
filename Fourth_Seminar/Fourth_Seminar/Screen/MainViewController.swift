//
//  MainViewController.swift
//  Fourth_Seminar
//
//  Created by 이성민 on 2023/05/06.
//

import UIKit

final class MainViewController: BaseViewController {
    
    // MARK: - properties
    
    
    
    // MARK: - life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUp()
    }
    
    // MARK: - set
    
    
    
    // MARK: - functions
    
    private func signUp() {
        
        SignUpService.shared.signUp(email: "seongminlee221@gmail.co.kr",
                                    nickname: "IDID", password: "123qAwe!") { response in
            switch response {
            case .success(let data):
                guard let data = data as? SignUpResponse else { return }
                dump(data)
            default:
                return
            }
        }
    }
    
    
    // MARK: - objc functions
    

}
