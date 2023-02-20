//
//  HomeView.swift
//  ImageDownloadApp
//
//  Created by Seokjune Hong on 2023/02/20.
//

import UIKit

import SnapKit

final class HomeView: UIView {
    let collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: setCollectionViewLayout())
        view.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.reuseIdentifier)
        view.backgroundColor = .clear
        return view
    }()
    
    let loadAllButton: UIButton = {
        let view = UIButton()
        view.setTitle("Load", for: .normal)
        view.backgroundColor = .blue
        view.setTitleColor(.white, for: .normal)
        view.layer.cornerRadius = 10
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .white
        
        [collectionView, loadAllButton].forEach {
            self.addSubview($0)
        }
    }
    
    private func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(loadAllButton.snp.top).inset(20)
        }
        
        loadAllButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(48)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(20)
        }
    }
    
    static func setCollectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: width, height: height * 0.15)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        return layout
    }
}
