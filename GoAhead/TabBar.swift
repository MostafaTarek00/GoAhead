//
//  TabBar.swift
//  GoAhead
//
//  Created by Ali Mohamed on 11/24/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit
import SOTabBar

class TabBar: SOTabBarViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SOTabBarSetting.tabBarTintColor =  UIColor.init(named: "Background")!
        SOTabBarSetting.tabBarCircleSize = CGSize(width: 60, height: 60)
        
        
        
        let HomeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainNavigationController1")
        let OfferViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainNavigationController2")
        let MostAddedViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainNavigationController3")
        let MyWishListViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainNavigationController4")
        let GoMallViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainNavigationController5")
        
        HomeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "homeGary"), selectedImage: UIImage(named: "home"))
        OfferViewController.tabBarItem = UITabBarItem(title: "Offers", image: UIImage(named: "offersGary"), selectedImage: UIImage(named: "offers"))
        MostAddedViewController.tabBarItem = UITabBarItem(title: "Added", image: UIImage(named: "mostAddedGary"), selectedImage: UIImage(named: "mostAdded"))
        MyWishListViewController.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(named: "wishListGary"), selectedImage: UIImage(named: "wishList"))
        GoMallViewController.tabBarItem = UITabBarItem(title: "Go Mall", image: UIImage(named: "goMallGary"), selectedImage: UIImage(named: "goMall"))
           
        viewControllers = [HomeViewController, OfferViewController,MostAddedViewController,MyWishListViewController,GoMallViewController]

        // Do any additional setup after loading the view.
    }
    
   
    
}
