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
        let forgetPasswordVc = storyboard?.instantiateViewController(identifier: "ForgetPasswordViewController")
            present(forgetPasswordVc!, animated: true, completion: nil)
            
    }
    
    @IBAction func signInbtnPressed(_ sender: UIButton) {
        if  userNameTf.text != "" , passwordTf.text != "" {
            self.startAnimating()
            DispatchQueue.main.async { [weak self] in
                APIClient.login(mail: (self?.userNameTf.text)!, password: (self?.passwordTf.text)!) { (Result) in
                    switch Result {
                    case .success(let response):
                        self?.stopAnimating()
                        print(response)
                        if response.status == 1 {
                            self?.performSegue(withIdentifier: "LogIn", sender: self)
                            print("loged In")
                        }
                    case .failure(let error):
                        self?.stopAnimating()
                        print(error.localizedDescription)
                        APIClient.loginError(mail: (self?.userNameTf.text)! , password: (self?.passwordTf.text)!) { (result) in
                            switch result {
                            case .success(let response):
                                Alert.show("Failed", massege: response.message, context: self!)
                                print(response)
                            case .failure(let error):
                                print(error.localizedDescription)
                            }
                        }
                    }
                }
            }
        } else {
            Alert.show("ERROR", massege: "enter email and password", context: self)
        }
    }
    
    @IBAction func registerBtnPressed(_ sender: UIButton) {
        let registerVc = storyboard?.instantiateViewController(identifier: "RegisterViewController")
                   present(registerVc!, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LogIn" {
            let vc = segue.destination as? TabBar
            vc?.modalPresentationStyle = .fullScreen
        }
    }
    
}
