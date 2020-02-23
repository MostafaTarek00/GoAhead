//
//  LunchCricleView.swift
//  Dr.Nour
//
//  Created by Mustafa on 12/20/19.
//  Copyright © 2019 begroup. All rights reserved.
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
