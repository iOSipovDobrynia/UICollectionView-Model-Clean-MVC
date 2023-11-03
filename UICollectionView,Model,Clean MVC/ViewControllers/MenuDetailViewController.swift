//
//  MenuDetailViewController.swift
//  UICollectionView,Model,Clean MVC
//
//  Created by Goodwasp on 03.11.2023.
//

import UIKit

class MenuDetailViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var name: UILabel!
    
    // MARK: - Public properties
    var menu: Menu?
    
    // MARK: - View's lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = menu?.name
        if let image = menu?.imageName {
            imageView.image = UIImage(named: image)
        }
    }
}
