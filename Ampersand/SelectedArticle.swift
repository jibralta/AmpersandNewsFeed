//
//  SelectedArticle.swift
//  Ampersand
//
//  Created by Joy Umali on 3/21/17.
//  Copyright © 2017 Joy Umali. All rights reserved.
//

import UIKit

class SelectedArticle: UIViewController {
    
    @IBOutlet weak var articleWebView: UIWebView!
    
    var article: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        articleWebView.loadRequest(URLRequest(url: URL(string:"https://www.google.com/")!))
        
        
        
        DispatchQueue.main.async {

        if let url = URL(string: self.article.articleURL!) {
            
            self.articleWebView.loadRequest(URLRequest(url: url))
            
            print(url)
        }
        
        }
    }
    


    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)

    }

    
    
}
