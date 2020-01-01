//
//  ViewController.swift
//  GoAhead
//
//  Created by Ali Mohamed on 11/20/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
@available(iOS 13.0, *)
class LoginViewController: UIViewController ,NVActivityIndicatorViewable{
    
    @IBOutlet weak var userNameTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func forgetPasswordBtnPressed(_ sender: UIButton) {
       if let vc = storyboard?.instantiateViewController(identifier: "ForgetPasswordViewController") as? ForgetPasswordViewController {
                        vc.modalPresentationStyle = .fullScreen
                        present(vc, animated: true, completion: nil)
                    }
        
    }
    
    @IBAction func signInbtnPressed(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(identifier: "TabBar") as? TabBar {
                         vc.modalPresentationStyle = .fullScreen
                         present(vc, animated: true, completion: nil)
                     }
        
    }
    
    @IBAction func registerBtnPressed(_ sender: UIButton) {
          if let vc = storyboard?.instantiateViewController(identifier: "RegisterViewController") as? RegisterViewController {
                  vc.modalPresentationStyle = .fullScreen
                  present(vc, animated: true, completion: nil)
              }
    }
    
    
    
}
