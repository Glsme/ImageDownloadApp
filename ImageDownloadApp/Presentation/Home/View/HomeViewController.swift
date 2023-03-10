//
//  ViewController.swift
//  ImageDownloadApp
//
//  Created by Seokjune Hong on 2023/02/20.
//

import UIKit

final class HomeViewController: UIViewController {
    private let mainView: HomeView = HomeView()
    private var isLoadAll: Bool = false
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

    private func configureUI() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.loadAllButton.addTarget(self, action: #selector(loadAllData), for: .touchUpInside)
    }
    
    @objc func loadAllData(_ sender: UIButton) {
        isLoadAll = true
        mainView.collectionView.reloadData()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageURLs.imageURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.reuseIdentifier, for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }
        
        cell.loadButton.tag = indexPath.item
        
        if isLoadAll {
            cell.loadAllImages(indexPath: indexPath)
        }
        
        return cell
    }
}
