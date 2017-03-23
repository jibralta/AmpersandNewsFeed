//
//  Category_CollectionViewCell.swift
//  Ampersand
//
//  Created by Joy Umali on 3/21/17.
//  Copyright © 2017 Joy Umali. All rights reserved.
//

import UIKit

class Category_CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var categoryLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
//    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>
//        (dataSourceDelegate: D, forRow row: Int) {
//        
//        collectionView.delegate = dataSourceDelegate
//        collectionView.dataSource = dataSourceDelegate
//        collectionView.tag = row
//        collectionView.reloadData()
//    }
    
    
    
}
