//
//  ForgetPasswordViewController.swift
//  GoAhead
//
//  Created by Mustafa on 11/21/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: UIViewController {
    
    @IBOutlet weak var emailTf: DesignableUITextField!{
        didSet{
        }
    }
    @IBOutlet weak var sendBtn: UIButton!{
        didSet{
            sendBtn.layer.cornerRadius = 5
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTf.addBottomBorder(width: self.view.frame.size.width - 90)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToLoginBtnPressed(_ sender: UIButton) {
      dismiss(animated: true, completion: nil)

    }
    
    
    @IBAction func sendPassBtnPressed(_ sender: UIButton) {
    }
}
