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
    
    // MARK: - properties
    
    let segmentButtonsScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    lazy var segmentButtons = [SegmentedButton]()
    
    lazy var segmentButtonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: segmentButtons)
        stackView.axis = .horizontal
        return stackView
    }()
    
    let bottomIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitleButtons()
        setLayout()
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
        
        segmentButtonsStackView.addSubview(bottomIndicatorView)
        bottomIndicatorView.snp.makeConstraints {
            $0.top.equalTo(segmentButtonsStackView.snp.bottom).offset(4)
            $0.leading.width.equalTo(segmentButtons[0].buttonTitleLabel)
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
                self?.configBottomIndicator(to: i)
                self?.segementedControlDelegate?.indexChanged(to: i)
            }
            segmentButton.addAction(action, for: .touchUpInside)
            segmentButtons.append(segmentButton)
        }
    }
    
    // MARK: - functions
    
    func configBottomIndicator(to i: Int) {
        var posX: CGFloat = 15
        for button in segmentButtons[0..<i] {
            posX += button.frame.width
        }
        let originY = bottomIndicatorView.frame.origin.y
        let changedWidth = segmentButtons[i].buttonTitleLabel.frame.width
        UIView.animate(withDuration: 0.3) {
            self.bottomIndicatorView.transform = CGAffineTransform(translationX: posX, y: 0)
            self.bottomIndicatorView.frame = .init(x: posX, y: originY, width: changedWidth, height: 4)
        }
    }

}

extension SegmentedButtonsView: CollectionViewStartScrollDelegate {
    
    func collectionViewStartScroll(to x: CGFloat) {
        
    }
    
}
