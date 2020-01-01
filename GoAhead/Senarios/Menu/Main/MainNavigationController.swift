//
//  MainNavigationController.swift
//  Konsil
//
//  Created by Ali Mohamed on 12/16/19.
//  Copyright © 2019 begroup. All rights reserved.
//

import UIKit
import SideMenu
class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

@available(iOS 13.0, *)
extension UIViewController {
    func showMenu() {
        navigationItem.hidesBackButton = true
        let rightBack = UIBarButtonItem(title: "", style: .done,target: self, action: #selector(menuBtn))
        rightBack.image = UIImage(named: "menu")
        rightBack.tintColor = UIColor.white
        navigationItem.rightBarButtonItem = rightBack
        let right2Back = UIBarButtonItem(title: "", style: .done,target: self, action: #selector(menuBtn))
        right2Back.image = UIImage(named: "shopping-cart")
        right2Back.tintColor = UIColor.white
        navigationItem.rightBarButtonItem = right2Back
        
        
        
      
    }
    
    
    @objc func menuBtn(){
        let vc = storyboard?.instantiateViewController(identifier: "SideMenuNavigationController") as! SideMenuNavigationController
         vc.settings = SharedMenu.settings(view: self.view)
        present(vc, animated: true, completion: nil)
        
        
    }
}
