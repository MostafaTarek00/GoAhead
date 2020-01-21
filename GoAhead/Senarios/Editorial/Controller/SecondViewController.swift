//
//  SecondViewController.swift
//  GoAhead
//
//  Created by Mustafa on 1/19/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SecondViewController: UIViewController {
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var animationLable: UILabel!
    @IBOutlet weak var v1: UIView!
    @IBOutlet weak var v2: UIView!
    @IBOutlet weak var v3: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fristAnm()
        cricleViewDesign(view: v1)
        cricleViewDesign(view: v2)
        cricleViewDesign(view: v3)
        swipToRightAndLeft()
        // Do any additional setup after loading the view.
    }
    
    func cricleViewDesign(view : UIView) {
        view.layer.cornerRadius = view.frame.size.height/2
        view.layer.cornerRadius = view.frame.size.height/2
        view.layer.cornerRadius = view.frame.size.height/2
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    
func fristAnm() {
let view = StartAnimationView.showLottie(view: self.animationView, fileName: "travel", contentMode: .scaleAspectFill)
    self.animationLable.text = "Travel and Tourism".localized

view.animationSpeed = 8
view.play { (finished) in
if finished {
view.isHidden = true
let view = StartAnimationView.showLottie(view: self.animationView, fileName: "restaurants", contentMode: .scaleAspectFill)
self.animationLable.text = "Restaurants".localized
view.play { (finished) in
if finished {
view.isHidden = true
let view = StartAnimationView.showLottie(view: self.animationView, fileName: "services", contentMode: .scaleAspectFill)
self.animationLable.text = "General Services".localized
view.play { (finished) in
if finished {
view.isHidden = true
let view = StartAnimationView.showLottie(view: self.animationView, fileName: "shopping2", contentMode: .scaleAspectFill)
self.animationLable.text = "Online Shopping".localized
view.play { (finished) in
if finished {
view.isHidden = true
let view = StartAnimationView.showLottie(view: self.animationView, fileName: "electronic", contentMode: .scaleAspectFill)
self.animationLable.text = "Electronic".localized
view.play { (finished) in
if finished {
view.isHidden = true
let view = StartAnimationView.showLottie(view: self.animationView, fileName: "food", contentMode: .scaleAspectFill)
self.animationLable.text = "Food Stuffs".localized
view.play { (finished) in
if finished {
view.isHidden = true
let view = StartAnimationView.showLottie(view: self.animationView, fileName: "pharmacies", contentMode: .scaleAspectFill)
self.animationLable.text = "Pharmacies".localized
view.play { (finished) in
if finished {
view.isHidden = true
let view = StartAnimationView.showLottie(view: self.animationView, fileName: "education", contentMode: .scaleAspectFill)
self.animationLable.text = "Courses and Education".localized
view.animationSpeed = 3
view.play { (finished) in
if finished {
view.isHidden = true
let view = StartAnimationView.showLottie(view: self.animationView, fileName: "cars", contentMode: .scaleAspectFill)
self.animationLable.text = "Cars".localized
view.animationSpeed = 2
view.play { (finished) in
if finished {
view.isHidden = true
let view = StartAnimationView.showLottie(view: self.animationView, fileName: "news", contentMode: .scaleAspectFill)
self.animationLable.text = "News".localized
view.animationSpeed = 2
view.play { (finished) in
if finished {
view.isHidden = true
let view = StartAnimationView.showLottie(view: self.animationView, fileName: "government", contentMode: .scaleAspectFill)
self.animationLable.text = "Government".localized
view.play { (finished) in
if finished {
view.isHidden = true
let view = StartAnimationView.showLottie(view: self.animationView, fileName: "banks", contentMode: .scaleAspectFill)
self.animationLable.text = "Banks".localized
view.play { (finished) in
if finished {
view.isHidden = true
let view = StartAnimationView.showLottie(view: self.animationView, fileName: "fashion", contentMode: .scaleAspectFill)
self.animationLable.text = "Fashion".localized
view.play { (finished) in
if finished {
view.isHidden = true
let view = StartAnimationView.showLottie(view: self.animationView, fileName: "saudiclubs", contentMode: .scaleAspectFill)
self.animationLable.text = "Saudi Clubs".localized
view.play { (finished) in
if finished {
   if let vc = self.storyboard?.instantiateViewController(identifier: "ThirdViewController") as? ThirdViewController {
       vc.modalPresentationStyle = .fullScreen
       self.present(vc, animated: true, completion: nil)
   }
    }

}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
    func swipToRightAndLeft(){
           let swipeToLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(_:)))
           swipeToLeft.direction = .left
           self.view.addGestureRecognizer(swipeToLeft)
           
           let swipeToRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(_:)))
           swipeToRight.direction = .right
           self.view.addGestureRecognizer(swipeToRight)
       }
       
       @objc func swipeAction(_ sender: UISwipeGestureRecognizer){
           if sender.direction == .right {
               let vc = storyboard?.instantiateViewController(identifier: "FristViewController") as! FristViewController
               vc.modalPresentationStyle = .fullScreen
               presentViewControllerWithTransition(viewController: vc, animated: true, direction: .fromRight)
           } else if sender.direction == .left {
               let vc = storyboard?.instantiateViewController(identifier: "ThirdViewController") as! ThirdViewController
               vc.modalPresentationStyle = .fullScreen
               presentViewControllerWithTransition(viewController: vc, animated: true, direction: .fromLeft)
           }
       }
    
    
    @IBAction func skipBtnPressed(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(identifier: "LoginViewController") as? LoginViewController {
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
    
}
    
    
   

   
        

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
