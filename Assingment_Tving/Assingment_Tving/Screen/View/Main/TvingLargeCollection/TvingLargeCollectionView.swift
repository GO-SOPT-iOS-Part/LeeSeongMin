//
//  TvingLargeCollectionView.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/02.
//

import UIKit

final class TvingLargeCollectionView: BaseTableViewCell {
    
    static let identifier = "TvingLargeCollectionView"
    
    enum Size {
        static let collectionViewHeight = SizeLiteral.Screen.width / 0.7
        static let cellHeight = SizeLiteral.Screen.width / 0.7
        static let cellWidth = SizeLiteral.Screen.width
    }
    
    private var data = [DummyColor]()
    
    // MARK: - properties
    
    lazy var largeCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.isScrollEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.isPagingEnabled = true
        view.contentInsetAdjustmentBehavior = .never
        view.insetsLayoutMarginsFromSafeArea = false
        view.register(TvingLargeCollectionViewCell.self, forCellWithReuseIdentifier: TvingLargeCollectionViewCell.identifier)
        return view
    }()
    
    private let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: Size.cellWidth, height: Size.cellHeight)
        return layout
    }()
    
    private lazy var pageIndicator: UIPageControl = {
        let indicator = UIPageControl()
        indicator.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        indicator.isUserInteractionEnabled = false
        return indicator
    }()
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setDataSource()
        setPageControl()
    }
    
    // MARK: -  set
    
    override func setLayout() {
        contentView.addSubview(largeCollectionView)
        largeCollectionView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(Size.cellHeight)
        }
        
        contentView.addSubview(pageIndicator)
        pageIndicator.snp.makeConstraints {
            $0.leading.equalTo(largeCollectionView).offset(-33)
            $0.bottom.equalToSuperview().inset(5)
        }
    }
    
    private func setDataSource() {
        self.largeCollectionView.dataSource = self
    }
    
    private func setPageControl() {
        self.largeCollectionView.delegate = self
    }
    
    // MARK: - functions
    
    func prepareCells(_ data: [DummyColor]) {
        self.data = data
    }
    
}


// MARK: - extension UIScrollViewDelegate

extension TvingLargeCollectionView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageIndicator.currentPage = Int(
            (largeCollectionView.contentOffset.x / largeCollectionView.frame.width).rounded(.toNearestOrAwayFromZero)
        )
    }
}


// MARK: - extension UICollectionViewDelegate

extension TvingLargeCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: Size.cellWidth, height: Size.cellHeight)
    }
}


// MARK: - extension UICollectionViewDataSource

extension TvingLargeCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageIndicator.numberOfPages = data.count
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TvingLargeCollectionViewCell.identifier, for: indexPath) as? TvingLargeCollectionViewCell
        else { return UICollectionViewCell() }
        cell.configureCell(data[indexPath.row], description: "test")
        return cell
    }
    
    
}