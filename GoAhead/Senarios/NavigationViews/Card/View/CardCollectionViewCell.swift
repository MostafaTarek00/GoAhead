//
//  CardCollectionViewCell.swift
//  GoAhead
//
//  Created by Mustafa on 1/2/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    
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
    
    @IBOutlet weak var countLbl: UILabel!{
        didSet{
            countLbl.layer.cornerRadius = 10
            countLbl.layer.borderWidth = 1.0
            countLbl.layer.borderColor = UIColor.gray.cgColor
            countLbl.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var minusBtn: UIButton!{
        didSet{
            minusBtn.layer.cornerRadius = 5
            minusBtn.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var plusBtn: UIButton!{
        didSet{
            plusBtn.layer.cornerRadius = 5
            plusBtn.clipsToBounds = true
        }
    }
    
    
    
    
    
    
    @IBAction func plusBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func minusBtnPressed(_ sender: UIButton) {
    }
    @IBAction func deleteBtnPressde(_ sender: UIButton) {
    }
}
