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
        
        DispatchQueue.main.async {
            
            if let url = URL(string: self.article.articleURL!) {
                
                self.articleWebView.loadRequest(URLRequest(url: url))
                
            }
            
        }
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    
    
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
}
