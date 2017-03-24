//
//  VerticalFeed_TVC.swift
//  Ampersand
//
//  Created by Joy Umali on 3/20/17.
//  Copyright © 2017 Joy Umali. All rights reserved.
//

import UIKit

class VerticalFeed_TVC: UITableViewController {
    
    var articles = [Article]() // initializing the variable pulling data from the Article Class.

    var sourceNameForURL =  String()

    var selectIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("greeting")
        let alertController = UIAlertController(title: "WELOCME!", message: "Have a nice day!", preferredStyle:UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "You too!", style: UIAlertActionStyle.destructive, handler: nil))
        self.present(alertController,animated: true, completion: nil)
        
        
        

        let apiManager = GoogleAPIManager()

        // CLEAR CELL BEFORE...
        
        apiManager.fetchArticle(source: sourceNameForURL) { ( articles) in
            
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

