//
//  MainNavigationController.swift
//  Konsil
//
//  Created by Ali Mohamed on 12/16/19.
//  Copyright © 2019 begroup. All rights reserved.
//

import UIKit
import SideMenu
import CoreData
import MOLH

class MainNavigationController: UINavigationController  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}

extension UIViewController {
    func showNavigation() {
        navigationItem.hidesBackButton = true
        let menu = UIBarButtonItem(title: "", style: .done,target: self, action: #selector(menuBtn))
        menu.image = UIImage(named: "menu")
        menu.tintColor = UIColor.white
        loadCardCount()
        let cartButton = SSBadgeButton()
        cartButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        cartButton.setImage(UIImage(named: "cart")?.withRenderingMode(.alwaysTemplate), for: .normal)
        cartButton.badgeEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 15)
        cartButton.addTarget(self, action: #selector(cartBtn), for: .touchUpInside)
        var number : String = String(Shared.cartArray.count)
        cartButton.badge = number
        let search = UIBarButtonItem(title: "", style: .done,target: self, action: #selector(searchBtn))
        search.image = UIImage(named: "search")
        search.tintColor = UIColor.white
        
        self.navigationItem.rightBarButtonItems = [menu,UIBarButtonItem(customView: cartButton),search]
        
        
    }
    
    func showAndBacNavigation() {
        navigationItem.hidesBackButton = true
        let menu = UIBarButtonItem(title: "", style: .done,target: self, action: #selector(menuBtn))
        menu.image = UIImage(named: "menu")
        menu.tintColor = UIColor.white
        loadCardCount()
        let cartButton = SSBadgeButton()
        cartButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        cartButton.setImage(UIImage(named: "cart")?.withRenderingMode(.alwaysTemplate), for: .normal)
        cartButton.badgeEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 15)
        cartButton.addTarget(self, action: #selector(cartBtn), for: .touchUpInside)
        var number : String = String(Shared.cartArray.count)
        cartButton.badge = number
        let search = UIBarButtonItem(title: "", style: .done,target: self, action: #selector(searchBtn))
        search.image = UIImage(named: "search")
        search.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItems = [menu,UIBarButtonItem(customView: cartButton),search]
        
        
        let back = UIBarButtonItem(title: "", style: .done,target: self, action: #selector(backBtn))
        if MOLHLanguage.currentAppleLanguage() == "en"{
            back.image = UIImage(named: "back")
        }
        else if  MOLHLanguage.currentAppleLanguage() == "ar"{
            back.image = UIImage(named: "backAr")
        }
        back.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = back
        
        
    }
    func loadCardCount() {
        do{
            let request : NSFetchRequest<Cart> = Cart.fetchRequest()
            Shared.cartArray = try Shared.context.fetch(request)
            
        }catch{
            print("Error Fetching Data From Context\(error)")
            
        }
    }
    
    
    @objc func menuBtn(){
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "SideMenuNavigationController") as! SideMenuNavigationController
            vc.settings = SharedMenu.settings(view: self.view)
            present(vc, animated: true, completion: nil)
            
        } else {
            // Fallback on earlier versions
        }
        
        
    }
    
    
    @objc func cartBtn(){
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "CardViewController") as! CardViewController
            navigationController?.pushViewController(vc, animated: true)
            
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    
    @objc func searchBtn(){
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "SearchViewController") as! SearchViewController
            vc.modalPresentationStyle = .overFullScreen
            vc.d = self
            self.present(vc, animated: true, completion: nil)
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    @objc func backBtn(){
        navigationController?.popViewController(animated: true)
        
    }
    
    func presentViewControllerWithTransition(viewController: UIViewController ,animated: Bool ,direction: CATransitionSubtype ){
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.fade
        transition.subtype = direction
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(viewController, animated: animated, completion: nil)
    }
}


extension UIViewController : SearchCategoryDelegate {
    func transferResultProduct(text: String) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "SearchProductViewController") as! SearchProductViewController
            vc.searchText = text
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    func transferResultSeller(text: String) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "SearchSellerViewController") as! SearchSellerViewController
            vc.searchText = text
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    
    func transferResultCat(text: String) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "SearchCategoryViewController") as! SearchCategoryViewController
            vc.searchText = text
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    
}
