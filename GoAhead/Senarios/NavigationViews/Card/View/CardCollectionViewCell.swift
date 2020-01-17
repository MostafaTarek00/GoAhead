//
//  CardCollectionViewCell.swift
//  GoAhead
//
//  Created by Mustafa on 1/2/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit
protocol UpdateCart {
    func update(countText : String , index : Int)
     func delete( index : Int)
    
}
class CardCollectionViewCell: UICollectionViewCell {
    var count : Int = 1
    var price : String?
    var totalPrice : Double = 1
    var delegate :  UpdateCart?
    var index : IndexPath?
    
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
        count = count + 1
        totalPrice = Double(price!)! * Double(count)
        countLbl.text = String(count)
        productPrice.text = String(totalPrice)
        delegate?.update(countText:  countLbl.text!, index: index!.item)
        
    }
    
    @IBAction func minusBtnPressed(_ sender: UIButton) {
        if count == 1 {
            totalPrice = Double(price!)! * Double(count)
            countLbl.text = String(count)
            productPrice.text = String(totalPrice)
            delegate?.update(countText:  countLbl.text!, index: index!.item)
            
        }else {
            count = count - 1
            totalPrice = Double(price!)! * Double(count)
            countLbl.text = String(count)
            productPrice.text = String(totalPrice)
            delegate?.update(countText:  countLbl.text!, index: index!.item)
            
        }
        
    }
    @IBAction func deleteBtnPressde(_ sender: UIButton) {
        delegate?.delete(index: index!.item)
    }
}
