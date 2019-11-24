//
//  RegisterViewController.swift
//  GoAhead
//
//  Created by Mustafa on 11/21/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class RegisterViewController: UIViewController {

    @IBOutlet weak var userNameRegTf: DesignableUITextField!
    @IBOutlet weak var emailRegTf: DesignableUITextField!
    @IBOutlet weak var phoneRegTf: DesignableUITextField!
    @IBOutlet weak var passwordRegTf: DesignableUITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func tackImageBtnPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func goToLoginBtnPressed(_ sender: UIButton) {
        let loginVc = storyboard?.instantiateViewController(identifier: "LoginViewController")
        loginVc?.modalPresentationStyle = .fullScreen
        present(loginVc!, animated: true, completion: nil)
    }
}
