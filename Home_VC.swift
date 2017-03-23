//
//  Home_VC.swift
//  Ampersand
//
//  Created by Joy Umali on 3/21/17.
//  Copyright © 2017 Joy Umali. All rights reserved.
//

import UIKit

class Home_VC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var tabCollectionView: UICollectionView!
    
    // MARK: Array of Images for Category Menu. Not pulling image from url.
    let categoryImages = ["techcrunch", "national-geographic", "espn", "bloomberg", "mashable"]
    let categoryNames = ["TECHNOLOGY", "SCIENCE & NATURE", "SPORTS", "BUSINESS", "ENTERTAINMENT"]
    
    var selectIndexPath: IndexPath?
    
    //    var articles = [Article]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    // MARK: CollectionView Data Source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView is TheChosenCollectionView {
            return categoryImages.count
        } else {
            return categoryNames.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView is TheChosenCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCategoryCell", for: indexPath) as? Category_CollectionViewCell
            
            
            // selects the category image depending on the row selected in indexpath.
            let image = categoryImages[indexPath.row]
            cell?.imageView.image = UIImage(named: image)
            
            // update category label
            let categoryName = categoryNames[indexPath.row]
            cell?.categoryLabel.text = categoryName
            
            return cell!
            
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCategoryCell", for: indexPath) as? TabCollectionViewCell
            
            // update category label
            let categoryName = categoryNames[indexPath.row]
            cell?.tabLabel.text = categoryName
            
            return cell!
            
            
        }
    }
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {
        
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
        
    }
    
    
    
    
}



class TheChosenCollectionView: UICollectionView {}






