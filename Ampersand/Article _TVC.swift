//
//  Article _TVC.swift
//  Ampersand
//
//  Created by Joy Umali on 3/20/17.
//  Copyright © 2017 Joy Umali. All rights reserved.
//

import UIKit

class Article_TVC: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var verticalTitle: UILabel!
    @IBOutlet weak var verticalImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.shadowColor = UIColor.gray.cgColor
        cardView.layer.shadowOpacity = 1
        cardView.layer.shadowOffset = CGSize.zero
        cardView.layer.shadowRadius = 1.25
        
        //    cardView.layer.shadowPath = UIBezierPath(rect: yourView.bounds).cgPath
        
        cardView.layer.shouldRasterize = true
        }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
    }
    
    
}
