//
//  TabBarCell.swift
//  GoAhead
//
//  Created by Maged on 12/4/18.
//  Copyright © 2018 Maged. All rights reserved.
//

import UIKit

class TabBarCell: UICollectionViewCell {
    
    @IBOutlet weak var MenuImage: UIImageView!
    @IBOutlet weak var MenuTitleLa: UILabel!
    
    
    override var isSelected: Bool{
        didSet{  //menuTitleLa.alpha =  isSelected ? 1.0:0.6
            self.contentView.backgroundColor = isSelected ?  UIColor(named: "Background") : UIColor.white
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // menuTitleLa.alpha =  0.6
        //self.contentView.backgroundColor = UIColor(named: "Background")
    }
    
    
    
}
