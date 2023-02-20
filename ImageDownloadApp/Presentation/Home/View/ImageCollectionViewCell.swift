//
//  ImageCollectionViewCell.swift
//  ImageDownloadApp
//
//  Created by Seokjune Hong on 2023/02/20.
//

import UIKit

import SnapKit

final class ImageCollectionViewCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = UIImage(systemName: "photo")
        return view
    }()
    
    let loadButton: UIButton = {
        let view = UIButton()
        view.setTitle("Load", for: .normal)
        view.backgroundColor = .blue
        view.setTitleColor(.white, for: .normal)
        view.layer.cornerRadius = 5
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
        [imageView, loadButton].forEach {
            self.addSubview($0)
        }
    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.width.equalTo(imageView.snp.height).multipliedBy(1.2)
            make.leading.equalToSuperview().inset(10)
        }
        
        loadButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.3)
            make.height.equalToSuperview().multipliedBy(0.25)
        }
    }
}
