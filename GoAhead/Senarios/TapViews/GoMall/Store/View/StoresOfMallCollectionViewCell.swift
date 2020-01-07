//
//  ProductOfMallCollectionViewCell.swift
//  GoAhead
//
//  Created by Mustafa on 11/24/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit

class StoresOfMallCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellView: UIView!{
        didSet{
           cellView.layer.cornerRadius = 10
           cellView.clipsToBounds = true
        }
    }
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeName: UILabel!
}
