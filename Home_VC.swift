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
    
    var selectIndexPath: IndexPath?
    
    var articles = [Article]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        private let baseURLString = "https://newsapi.org/v1/articles?source=\(source)google-news&sortBy=top&apiKey=ea22065a86a84832bd357ce90368684f"
        
        let categoryManager = GoogleAPIManager()
        
        categoryManager.fetchArticle { (articles) in
            self.articles = articles
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
        
        //        collectionView.dataSource = categoryManager
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCategoryCell", for: indexPath) as? Category_CollectionViewCell
        
        
        // grab article data for each cell
        let article = articles[indexPath.row]
        cell?.articleTitle.text = article.title
        
        // grab name of category for category header.  Should this be configured separately from the main colleciton view?
//        cell?.tabLabel.text = "Test Tab"
        
        // Download and display image
        article.downloadImage { (articles) in
            cell?.imageView?.image = articles
        }
        

        
            return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // user selected an index path
        selectIndexPath = indexPath
    
        // segue into the next view with the chosen article (later will be the category if have time)
        performSegue(withIdentifier: "ToArticleSegue", sender: self)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SelectedArticle {
            if let selectIndexPath = selectIndexPath {
                destination.article = articles[selectIndexPath.row]
            }
        }
    }
    
}









