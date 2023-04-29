//
//  SegmentedButtonsView.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/04/28.
//

import UIKit

import SnapKit

// MARK: - protocols

protocol CollectionViewStartScrollDelegate: AnyObject {
    func collectionViewStartScroll(to x: CGFloat)
}

protocol SegmentedControlDelegate: AnyObject {
    func indexChanged(to index: Int)
}


// MARK: - class

final class SegmentedButtonsView: UIView {
    
    enum Titles: String, CaseIterable {
        case home = "홈"
        case live = " 실시간"
        case tvProgram = "TV프로그램"
        case movie = "영화"
        case paramount = "파라마운트"
        case kids = "키즈"
    }
    
    private let titles = Titles.allCases.map { $0.rawValue }
    
    weak var segementedControlDelegate: SegmentedControlDelegate?
    
    var selectedButtonIndex: Int = 0 {
        didSet {
            configBottomSelector(to: selectedButtonIndex)
        }
    }
    
    // MARK: - properties
    
    let segmentButtonsScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    lazy var segmentButtons = [UIButton]()
    
    lazy var segmentButtonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: segmentButtons)
        stackView.axis = .horizontal
        stackView.spacing = 30
        return stackView
    }()
    
    let bottomBorderView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitleButtons()
        setLayout()
        configBottomSelector(to: 0)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -  set
    
    private func setLayout() {
        addSubview(segmentButtonsScrollView)
        segmentButtonsScrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        segmentButtonsScrollView.addSubview(segmentButtonsStackView)
        segmentButtonsStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        segmentButtonsScrollView.addSubview(bottomBorderView)
        bottomBorderView.snp.makeConstraints {
            $0.top.equalTo(segmentButtonsStackView.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
            $0.width.equalTo(segmentButtons[0].snp.width)
            $0.height.equalTo(4)
        }
    }
    
    private func setTitleButtons() {
        for (i, title) in titles.enumerated() {
            let segmentButton = SegmentedButton(title: title)
            if i == 1 {
                let title = title.setAttrubutedString(with: ImageLiteral.liveTV!)
                segmentButton.replaceTitleWithAttributedTitle(title)
            }
            
            let action = UIAction { [weak self] _ in
                self?.configBottomSelector(to: i)
            }
            segmentButton.addAction(action, for: .touchUpInside)
            segmentButtons.append(segmentButton)
        }
    }
    
    // MARK: - functions
    
    private func configBottomSelector(to i: Int) {
        // bottomBorderView 의 크기를 설정
        var xPos: CGFloat = 0
        for button in segmentButtons[0..<i] {
            xPos += button.frame.width + 30
        }
//        let scale = segmentButtons[i].frame.width
        UIView.animate(withDuration: 0.2) {
            self.bottomBorderView.transform = CGAffineTransform(translationX: xPos, y: 0)
        }
    }

}

extension SegmentedButtonsView: CollectionViewStartScrollDelegate {
    
    func collectionViewStartScroll(to x: CGFloat) {
        if x < 0 && selectedButtonIndex < titles.count - 1 {
            selectedButtonIndex += 1
        } else if x > 0 && selectedButtonIndex > 1 {
            selectedButtonIndex -= 1
        }
    }
    
}
