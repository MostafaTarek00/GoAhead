//
//  CollectionCell.swift
//  GoAhead
//
//  Created by Mustafa on 12/30/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit

class CollectionCell: UIView {
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUiview()
    }
    
    func setUpUiview()  {
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.gray.cgColor
        self.clipsToBounds = true
        
        
    }
    
    
    
    
    
}
