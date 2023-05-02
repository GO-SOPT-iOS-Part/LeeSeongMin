//
//  TvingSmallCollectionView.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/02.
//

import UIKit

final class TvingSmallCollectionView: BaseTableViewCell {
    
    static let identifier = "TvingSmallCollectionView"
    enum Size {
        static let collectionViewHeight: CGFloat = 200
        static let cellWidth: CGFloat = 100
        static let cellHeight: CGFloat = 100 / 0.7
    }
    
    private var data = [DummyColor]()
    
    // MARK: - properties
    
    private let smallCollectionViewTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "제목"
        label.textColor = .white1
        label.font = .largeBold
        return label
    }()
    
    lazy var smallCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
        view.isScrollEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.register(TvingSmallCollectionViewCell.self, forCellWithReuseIdentifier: TvingSmallCollectionViewCell.identifier)
        return view
    }()
    
    private let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: Size.cellWidth, height: Size.cellHeight)
        return layout
    }()
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setDataSource()
    }
    
    // MARK: -  set
    
    override func setLayout() {
        contentView.addSubview(smallCollectionViewTitleLabel)
        smallCollectionViewTitleLabel.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview().inset(SizeLiteral.Common.sideMediumPadding)
        }
        
        contentView.addSubview(smallCollectionView)
        smallCollectionView.snp.makeConstraints {
            $0.top.equalTo(smallCollectionViewTitleLabel.snp.bottom)
            $0.horizontalEdges.equalToSuperview().inset(SizeLiteral.Common.sideMediumPadding)
            $0.height.equalTo(Size.cellHeight)
        }
    }
    
    private func setDataSource() {
        self.smallCollectionView.dataSource = self
    }
    
    // MARK: - func
    
    func prepareCells(_ colors: [DummyColor]) {
        self.data = colors
    }
    
}


// MARK: - extension

extension TvingSmallCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TvingSmallCollectionViewCell.identifier, for: indexPath) as? TvingSmallCollectionViewCell
        else { return UICollectionViewCell() }
        cell.configureCell(data[indexPath.row])
        return cell
    }
    
    
}