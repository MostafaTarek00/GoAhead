//
//  SegmentedViewController.swift
//  GoAhead
//
//  Created by Mustafa on 3/15/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit

class SegmentedViewController: UIViewController {

      static var url : String?
      static var imageLink : String?
      static var favorite : Int?
      static var nameText : String?
      static var catId : String?
      static var offerId : String?
    weak var currentViewController : UIViewController?
    @IBOutlet weak var choiseView: UIView!
    @IBOutlet weak var SegmentedView: UISegmentedControl!{
        didSet{
            self.customizeSigmanted(for: self.SegmentedView)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
          showAndBacNavigation()
        updateViewDesign()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Func to Update Design
     
     func updateViewDesign() {
         self.currentViewController = self.storyboard?.instantiateViewController(withIdentifier: "WebSiteDeatilsViewController")
         self.currentViewController?.view.translatesAutoresizingMaskIntoConstraints = false
         self.addChild(self.currentViewController!)
         self.addSubview(subView: self.currentViewController!.view, toView: self.choiseView)
     }
    
    //MARK:- Customize Segmant Controller
       func customizeSigmanted(for segmantController: UISegmentedControl) {
           let titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .semibold)]
           
           let selectedTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white , NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .semibold)]
           
           segmantController.setTitleTextAttributes(titleTextAttributes, for: .normal)
           segmantController.setTitleTextAttributes(selectedTitleTextAttributes, for: .selected)
           
           
       }
       
       //MARK: - One Func to Change View When Press In Siggmanted
       
       func cycleFromViewController(oldViewController: UIViewController, toViewController newViewController: UIViewController) {
           oldViewController.willMove(toParent: nil)
           self.addChild(newViewController)
           self.addSubview(subView: newViewController.view, toView:self.choiseView!)
           newViewController.view.alpha = 0
           newViewController.view.layoutIfNeeded()
           UIView.animate(withDuration: 0.5, animations: {
               newViewController.view.alpha = 1
               oldViewController.view.alpha = 0
           },completion: { finished in
               oldViewController.view.removeFromSuperview()
               oldViewController.removeFromParent()
               newViewController.didMove(toParent: self)
           }
           )
       }
       
       //MARK: - Two Func to Change View When Press In Siggmanted
       
       func addSubview(subView:UIView, toView parentView:UIView) {
           parentView.addSubview(subView)
           var viewBindingsDict = [String: AnyObject]()
           viewBindingsDict["subView"] = subView
           parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subView]|",
                                                                    options: [], metrics: nil, views: viewBindingsDict))
           parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subView]|",
                                                                    options: [], metrics: nil, views: viewBindingsDict))
       }
    

    @IBAction func choiseView(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
                   let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "WebSiteDeatilsViewController")
                   newViewController!.view.translatesAutoresizingMaskIntoConstraints = false
                   
                   self.cycleFromViewController(oldViewController: self.currentViewController!, toViewController: newViewController!)
                   self.currentViewController = newViewController
               }  else {
                   let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "CommentsViewController")
                   newViewController!.view.translatesAutoresizingMaskIntoConstraints = false
                   
                   self.cycleFromViewController(oldViewController: self.currentViewController!, toViewController: newViewController!)
                   self.currentViewController = newViewController
                   
               }
    }
    

}
