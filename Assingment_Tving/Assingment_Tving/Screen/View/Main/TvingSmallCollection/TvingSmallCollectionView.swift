//
//  TvingSmallCollectionView.swift
//  Assingment_Tving
//
//  Created by 이성민 on 2023/05/02.
//

import UIKit

final class TvingSmallCollectionView: BaseTableViewCell {
    
    static let identifier = "TvingSmallCollectionView"
    static let cellHeight = 150
    
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
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.clipsToBounds = true
        collectionView.register(TvingSmallCollectionViewCell.self, forCellWithReuseIdentifier: TvingSmallCollectionViewCell.identifier)
        return collectionView
    }()
    
    private let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 150, height: cellHeight)
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
            $0.top.horizontalEdges.equalToSuperview()
        }
        
        contentView.addSubview(smallCollectionView)
        smallCollectionView.snp.makeConstraints {
            $0.top.equalTo(smallCollectionViewTitleLabel.snp.bottom)
            $0.horizontalEdges.equalToSuperview().inset(SizeLiteral.Common.sideMediumPadding)
            $0.height.equalTo(200)
        }
    }
    
    private func setDataSource() {
        self.smallCollectionView.dataSource = self
    }
    
    // MARK: - func
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        
    }
    
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
