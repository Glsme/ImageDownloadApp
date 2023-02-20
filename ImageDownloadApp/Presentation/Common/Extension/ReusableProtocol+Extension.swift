//
//  ReusableProtocol+Extension.swift
//  ImageDownloadApp
//
//  Created by Seokjune Hong on 2023/02/20.
//

import UIKit

extension UICollectionViewCell: ReusableProtocol {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
