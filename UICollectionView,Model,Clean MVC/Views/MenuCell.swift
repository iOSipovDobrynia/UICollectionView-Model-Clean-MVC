//
//  MenuCell.swift
//  UICollectionView,Model,Clean MVC
//
//  Created by Goodwasp on 03.11.2023.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    // MARK: - IBoutlets
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    // MARK: - Methods
    func configure(with menu: Menu) {
        nameLabel.text = menu.name
        
        if let image = menu.imageName {
            imageView.image = UIImage(named: image)
        }
    }
}
