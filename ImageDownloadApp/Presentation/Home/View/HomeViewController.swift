//
//  ViewController.swift
//  ImageDownloadApp
//
//  Created by Seokjune Hong on 2023/02/20.
//

import UIKit

final class HomeViewController: UIViewController {
    private let mainView: HomeView = HomeView()
    
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
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.reuseIdentifier, for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
}
