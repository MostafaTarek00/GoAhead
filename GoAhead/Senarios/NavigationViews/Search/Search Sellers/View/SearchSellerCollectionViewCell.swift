//
//  SearchSellerCollectionViewCell.swift
//  GoAhead
//
//  Created by Mustafa on 1/13/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit

class SearchSellerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellView: UIView!{
        didSet{
           cellView.layer.cornerRadius = 10
           cellView.clipsToBounds = true
        }
    }
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeName: UILabel!
}
