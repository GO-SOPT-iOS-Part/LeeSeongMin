//
//  MovieCarouselView.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/27.
//

import UIKit

import SnapKit

final class MovieCarouselView: UIScrollView {
    
    let dummyMovies = Movie.dummy()
    
    // MARK: - properties
    
    
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -  set
    
    private func setMovieImages() {
        for movie in dummyMovies {
            let movieView = UIView()
            
        }
    }

}
