//
//  ViewController.swift
//  ImageDownloadApp
//
//  Created by Seokjune Hong on 2023/02/20.
//

import UIKit

final class HomeViewController: UIViewController {
    private let mainView: HomeView = HomeView()
    private let viewModel: HomeViewModel = HomeViewModel()
    
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
        return viewModel.imageURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.reuseIdentifier, for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }
        
        cell.loadButton.tag = indexPath.item
        
//        DispatchQueue.global().async { [weak self] in
//            guard let self = self else { return }
//            let url = URL(string: self.viewModel.imageURLs[indexPath.item])!
//            let data = try! Data(contentsOf: url)
//
//            DispatchQueue.main.async {
//                cell.imageView.image = UIImage(data: data)
//            }
//        }
        
        return cell
    }
}
