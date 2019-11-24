//
//  AddFavClass.swift
//  GoAhead
//
//  Created by Maged on 12/4/18.
//  Copyright © 2018 Maged. All rights reserved.
//

import Foundation
import UIKit

class CheckBox: UIButton {
    // Images
    let checkedImage = UIImage(named: "fav1")! as UIImage
    let uncheckedImage = UIImage(named: "fav")! as UIImage
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
                print("add to fav")
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
                print("remove from Fav")
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        //self.isChecked = false
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
