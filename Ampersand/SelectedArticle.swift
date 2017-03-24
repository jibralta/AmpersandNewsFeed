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
        
//        self.navigationController?.isNavigationBarHidden = false

    }
    

    @IBAction func dismissButtonPressed(_ sender: UIButton) {
        
                dismiss(animated: true, completion: nil)
    }
}
