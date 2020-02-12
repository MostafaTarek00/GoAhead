//
//  ThirdViewController.swift
//  GoAhead
//
//  Created by Mustafa on 1/20/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var v1: UIView!
    @IBOutlet weak var v2: UIView!
    @IBOutlet weak var v3: UIView!
    @IBOutlet weak var startBtn: UIButton!{
        didSet{
            startBtn.layer.cornerRadius = 10
            startBtn.layer.borderWidth = 2
            startBtn.layer.borderColor = UIColor.blue.cgColor
            startBtn.clipsToBounds = true
        }
        
    }
    
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
                let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
                vc.modalPresentationStyle = .fullScreen
                           presentViewControllerWithTransition(viewController: vc, animated: true, direction: .fromRight)
            
           
        } else if sender.direction == .left {
                let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                vc.modalPresentationStyle = .fullScreen
                           presentViewControllerWithTransition(viewController: vc, animated: true, direction: .fromLeft)
           
           
        }
    }
    
    func fristAnm() {
        let view = StartAnimationView.showLottie(view: self.animationView, fileName: "shopping1", contentMode: .scaleAspectFill)
        view.play { (finished) in
            if finished {
                view.isHidden = true
                let view = StartAnimationView.showLottie(view: self.animationView, fileName: "shopping3", contentMode: .scaleAspectFill)
                view.play { (finished) in
                    if finished {
                        view.isHidden = true
                        let view = StartAnimationView.showLottie(view: self.animationView, fileName: "shopping4", contentMode: .scaleAspectFill)
                        view.play { (finished) in
                            if finished {
                                
                            }
                        }
                    }
                }
            }
        }
    }

        
    
    @IBAction func startBtnPressed(_ sender: UIButton) {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
                vc.modalPresentationStyle = .fullScreen
                present(vc, animated: true, completion: nil)
            }
       
    }
    
}
