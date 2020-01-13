//
//  SearchProductCollectionViewCell.swift
//  GoAhead
//
//  Created by Mustafa on 1/13/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit

class SearchProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellView: UIView!{
           didSet{
               cellView.layer.cornerRadius = 10
               cellView.layer.borderWidth = 1.0
               cellView.layer.borderColor = UIColor.white.cgColor
               cellView.clipsToBounds = true
               
           }
       }
       @IBOutlet weak var productTitle: UILabel!
       @IBOutlet weak var productImage: UIImageView!
       @IBOutlet weak var productDes: UILabel!
       @IBOutlet weak var productPrice: UILabel!
}
