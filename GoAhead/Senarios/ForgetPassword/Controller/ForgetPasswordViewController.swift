//
//  ForgetPasswordViewController.swift
//  GoAhead
//
//  Created by Mustafa on 11/21/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: UIViewController {
    
    @IBOutlet weak var emailTf: DesignableUITextField!
    @IBOutlet weak var sendBtn: UIButton!{
        didSet{
            sendBtn.layer.cornerRadius = 20
            sendBtn.layer.borderWidth = 2
            sendBtn.layer.borderColor = UIColor.white.cgColor
            sendBtn.clipsToBounds = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToLoginBtnPressed(_ sender: UIButton) {
      dismiss(animated: true, completion: nil)

    }
    
    
    @IBAction func sendPassBtnPressed(_ sender: UIButton) {
    }
}
