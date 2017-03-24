//
//  Home_VC.swift
//  Ampersand
//
//  Created by Joy Umali on 3/21/17.
//  Copyright © 2017 Joy Umali. All rights reserved.
//

import UIKit

class Home_VC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK:  IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tabCollectionView: UICollectionView!
    
    // MARK: Array of Images for Category Menu.
    
    var home = String()
    
    let categoryImages = ["techcrunch", "national-geographic", "espn", "bloomberg", "mashable"]
    let categoryNames = ["TECHNOLOGY", "SCIENCE & NATURE", "SPORTS", "BUSINESS", "ENTERTAINMENT"]
    
    var selectIndexPath: IndexPath?
    
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let welcomeAlert = UIAlertController(title: "PRIVACY ALERT", message: "Allow the government to follow your every move.", preferredStyle: UIAlertControllerStyle.alert)
        welcomeAlert.addAction(UIAlertAction(title: "Definitely", style: UIAlertActionStyle.default, handler: nil))
        self.present(welcomeAlert, animated: true, completion: nil)
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        
        // MARK: Collection View Flow Layout
        
//        let screenSize = UIScreen.main.bounds
//        
//        let collectionViewFlowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        collectionViewFlowLayout.itemSize = CGSize(width: screenSize.width / 2.0, height: screenSize.height / 2.0)
//        collectionViewFlowLayout.minimumInteritemSpacing = 0.0
//        collectionViewFlowLayout.minimumLineSpacing = 20.0
//        
//        let mainSectionInset = screenSize.width / 4.0
//        collectionViewFlowLayout.sectionInset = UIEdgeInsetsMake(0.0, mainSectionInset, 0.0, mainSectionInset)
//        
//        let tabCollectionViewFlowLayout = tabCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        
//        let iconHeight = tabCollectionView.frame.height - 20.0
//        tabCollectionViewFlowLayout.itemSize = CGSize(width: iconHeight, height: iconHeight)
//        tabCollectionViewFlowLayout.minimumInteritemSpacing = 0.0
//        tabCollectionViewFlowLayout.minimumLineSpacing = 50.0
//        
//        let tabSectionInset = mainSectionInset + (collectionViewFlowLayout.itemSize.width - tabCollectionViewFlowLayout.itemSize.width) / 2.0
//        tabCollectionViewFlowLayout.sectionInset = UIEdgeInsetsMake(0.0, tabSectionInset, 0.0, tabSectionInset)
//        
        
    }
    }
    
    // MARK: translucent Nav Bar for Home Scene.

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationItem.title = ""

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false

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
            
            // update category label from the categoryNames array above. (temporarily uninstalled)
            cell?.categoryLabel.text = categoryNames[indexPath.row]
            
            // updates category header above image. (tabCategoryCell temporarily uninstalled)
            cell?.categoryHeader.text = categoryNames[indexPath.row]
            cell?.categoryLabel.text = categoryNames[indexPath.row]


            
            return cell!

        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCategoryCell", for: indexPath) as? TabCollectionViewCell
            
            // update category label for tabCollectionView
            cell?.tabLabel.text = categoryNames[indexPath.row]
            
            return cell!

        }
    }
    
    // MARK: COLLECTION VIEW UI
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: -10, right: 0)
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
                destination.navTitle = categoryNames[selectIndexPath.row]

               
            }
        }
    }
    
    
    // MARK: Link the Collection Views
    private func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let collectionViewFlowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let tabCollectionViewFlowLayout = tabCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let mainDistanceBetweenItemsCenter = collectionViewFlowLayout.minimumLineSpacing + collectionViewFlowLayout.itemSize.width
        let tabDistanceBetweenItemsCenter = tabCollectionViewFlowLayout.minimumLineSpacing + tabCollectionViewFlowLayout.itemSize.width
        let offsetFactor = mainDistanceBetweenItemsCenter / tabDistanceBetweenItemsCenter
        
        if (scrollView == collectionView) {
            let xOffset = scrollView.contentOffset.x - scrollView.frame.origin.x
            tabCollectionView.contentOffset.x = xOffset / offsetFactor
        }
        else if (scrollView == tabCollectionView) {
            let xOffset = scrollView.contentOffset.x - scrollView.frame.origin.x
            collectionView.contentOffset.x = xOffset * offsetFactor
        }
    }
}



class TheChosenCollectionView: UICollectionView {}






