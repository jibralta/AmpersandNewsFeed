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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    func request()
//    {
//        let URL = URL(string: "https://newsapi.org/v1/articles?source=national-geographic&sortBy=top&apiKey=ea22065a86a84832bd357ce90368684f")
//        let feedParser = MyFeedParser(feedURL: URL)
//        feedParser.delegate = self
//        feedParser.parser()
//    }
//    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath)

        // Configure the cell...

        return cell
    }


}



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

