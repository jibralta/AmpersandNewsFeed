//
//  Home_VC.swift
//  Ampersand
//
//  Created by Joy Umali on 3/21/17.
//  Copyright © 2017 Joy Umali. All rights reserved.
//

import UIKit

class Home_VC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK:  IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tabCollectionView: UICollectionView!
    
    // MARK: Array of Images for Category Menu.
    
    let categoryImages = ["techcrunch", "national-geographic", "espn", "bloomberg", "mashable"]
    let categoryNames = ["TECHNOLOGY", "SCIENCE & NATURE", "SPORTS", "BUSINESS", "ENTERTAINMENT"]
    
    var selectIndexPath: IndexPath?
    
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        
    }
    
    // MARK: CollectionView Data Source for both Collection Views
    
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
            
            
            // selects the category image from the categoryImages array above.
            cell?.imageView.image = UIImage(named:categoryImages[indexPath.row])
            
            // update category label from the categoryNames array above
            cell?.categoryLabel.text = categoryNames[indexPath.row]
            
            return cell!
            
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCategoryCell", for: indexPath) as? TabCollectionViewCell
            
            // update category label for tabCollectionView
            let categoryName = categoryNames[indexPath.row]
            cell?.tabLabel.text = categoryName
            
            return cell!
            
        }
    }
    
    
    
    // MARK: Segue
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectIndexPath = indexPath
        
        performSegue(withIdentifier: "ToVerticalFeed", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? VerticalFeed_TVC {
            if let selectIndexPath = selectIndexPath {
                
                // send the articles of the selected category to the vertical feed scene.
                
                destination.sourceNameForURL = categoryImages[selectIndexPath.row]
            }
        }
    }
    
    
}



class TheChosenCollectionView: UICollectionView {}






