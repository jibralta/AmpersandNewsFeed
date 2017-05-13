//
//  VerticalFeed_TVC.swift
//  Ampersand
//
//  Created by Joy Umali on 3/20/17.
//  Copyright © 2017 Joy Umali. All rights reserved.
//

import UIKit

class VerticalFeed_TVC: UITableViewController {
        
//    @IBOutlet weak var categoryTitle: UINavigationItem!
    
    var articles = [Article]() // initializing the variable pulling data from the Article Class.

    var sourceNameForURL =  String()

    var selectIndexPath: IndexPath?

    var navTitle = String()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = navTitle

        let apiManager = GoogleAPIManager()
    
        apiManager.fetchArticle(source: sourceNameForURL) { (articles) in

            self.articles = articles
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! Article_TVC

        cell.verticalImage.image = nil
        cell.verticalTitle.text = articles[indexPath.row].title
        cell.infoLabel.text = articles[indexPath.row].newsOrigin!

            
//            articles[indexPath.row].categoryNames[indexPath.row]
        
//        categoryNames
            //            + " • " + articles[indexPath.row].publishedTime!
        // sourceNameForURL + " • " +
        
        articles[indexPath.row].downloadImage(imageURL: articles[indexPath.row].imageURL!){ (image) in
           
            DispatchQueue.main.async {
            
                cell.verticalImage.image = image

            }

        }
        
        return cell
    }

    // MARK: Segue

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectIndexPath = indexPath
        
        performSegue(withIdentifier: "ToSelectedArticle", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? SelectedArticle {
            if let selectIndexPath = selectIndexPath {
            
                destination.article = articles[selectIndexPath.row]
        }
            

    }

    }

}

