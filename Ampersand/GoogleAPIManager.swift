//
//  GoogleAPIManager.swift
//  Ampersand
//
//  Created by Joy Umali on 3/20/17.
//  Copyright © 2017 Joy Umali. All rights reserved.
//

import Foundation

class GoogleAPIManager {

    let apiURL = "https://newsapi.org/v1/articles?source=national-geographic&sortBy=top&apiKey=ea22065a86a84832bd357ce90368684f"

    
    // fetch entire article.
    func fetchArticle(completion: @escaping ([Article]) -> Void) { // ask how to grab the article body
        
        guard let url = URL(string: apiURL) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else { return }
            
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
                print(json)
                
                guard let items = json["articles"] as? [[String: Any]] else {
                    return
                }
                
                var articles = [Article]()
                for item in items {
                    if let category = Article.create(from: item) {
                        articles.append(category)
                    }
                }
                
                completion(articles)
                
            } catch {
                
                print(error)
            }
        }
        task.resume()
        
    }
}


