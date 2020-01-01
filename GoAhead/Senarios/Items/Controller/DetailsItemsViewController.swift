//
//  DetailsItemsViewController.swift
//  GoAhead
//
//  Created by Mustafa on 11/24/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit

class DetailsItemsViewController: UIViewController {
    
    @IBOutlet weak var HeaderOfDetailsItems: UIView!
    
    @IBOutlet weak var HeaderOfDetailsItemsImage: UIImageView!
    @IBOutlet weak var detailsView: UIView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var goTOwebBtn: UIButton!
    
    @IBOutlet weak var line1View: UIView!
    
    @IBOutlet weak var line2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func favBtnPressed(_ sender: UIButton) {
    }
    
}
