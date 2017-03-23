//
//  Article.swift
//  Ampersand
//
//  Created by Joy Umali on 3/20/17.
//  Copyright © 2017 Joy Umali. All rights reserved.
//

import UIKit

class Article: NSObject {
    
    var imageURL: String?
    var title: String?
    var newsOrigin: String?
    var publishedTime: String?
    var articleURL: String?
    
    init(imageURL: String?, title: String?, newsOrigin: String?, publishedTime: String?, articleURL: String?) {
        self.imageURL = imageURL
        self.title = title
        self.newsOrigin = newsOrigin
        self.publishedTime = publishedTime
        self.articleURL = articleURL
        
    }
    
    
    // Create function for loading Image.
    
    func downloadImage(completion: @escaping (UIImage) -> Void) {
        
        guard let foundImageURL = URL(string: imageURL!) else { return }
        
        let task = URLSession.shared.dataTask(with: foundImageURL) { (data, response, error) in
            
            guard error == nil, let data = data else { return }
            
            if let image = UIImage(data: data) {
                completion(image)
                
            }
        }
        task.resume()
    }
    
    
    // Fetch the data by creating a method to create a URLRequest. Then use URLSession to create a URLSessionDataTask to transfer request to the server.
    static func create(from dictionary: [String: Any]) -> Article? {
        // UIImageURL "urlToImage"
        guard let imageURL = dictionary["urlToImage"] as? String else {
            return nil
        }
        
        // Title "title"
        guard let title = dictionary["title"] as? String else {
            return nil
        }
        
        // News Origin (and/or author) "author"
        guard let author = dictionary["author"] as? String else {
            return nil
        }
        
        // Article "url"
        guard let articleURL = dictionary["url"] as? String else {
            return nil
        }
        
        // Published time "publishedAt"
        guard let publishedTime = dictionary["publishedAt"] as? String else {
            return nil
        }
        
        return Article(imageURL: imageURL, title: title, newsOrigin: author, publishedTime: publishedTime, articleURL: articleURL)
    }
    
    
}
