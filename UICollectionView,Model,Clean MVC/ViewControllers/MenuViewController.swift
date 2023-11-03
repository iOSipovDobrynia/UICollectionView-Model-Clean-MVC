//
//  MenuViewController.swift
//  UICollectionView,Model,Clean MVC
//
//  Created by Goodwasp on 03.11.2023.
//

import UIKit

class MenuViewController: UIViewController {

    // MARK: - IBoutlets
    @IBOutlet var collectionView: UICollectionView!
    
    // MARK: - private properties
    private var menuItems: [Menu] = {
        var blankMenu = Menu()
        blankMenu.name = "Coca-Cola"
        blankMenu.imageName = "cola"
        
        var blankMenuTwo = Menu()
        blankMenuTwo.name = "John Golt"
        blankMenuTwo.imageName = "5555766"
        
        return [blankMenu, blankMenuTwo]
    }()
    
    // MARK: - View's lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let vc = segue.destination as? MenuDetailViewController else { return }
            vc.menu = sender as? Menu
        }
    }
}

// MARK: - UICollectionViewDelegate
extension MenuViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menu = menuItems[indexPath.item]
        collectionView.deselectItem(at: indexPath, animated: true)
        performSegue(withIdentifier: "showDetail", sender: menu)
        
        
    }
}

// MARK: - UICollectionViewDataSource
extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath)
        guard let cell = cell as? MenuCell else { return UICollectionViewCell() }
        let menu = menuItems[indexPath.item]
        cell.configure(with: menu)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 2
        let paddingWidth = 20 * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: 1.5 * widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
}
