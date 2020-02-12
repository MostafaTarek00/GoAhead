//
//  FristViewController.swift
//  GoAhead
//
//  Created by Mustafa on 1/19/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit

class FristViewController: UIViewController {
    
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var v1: UIView!
    @IBOutlet weak var v2: UIView!
    @IBOutlet weak var v3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fristAnm()
        cricleViewDesign(view: v1)
        cricleViewDesign(view: v2)
        cricleViewDesign(view: v3)
        swipToRight()
        
        
        // Do any additional setup after loading the view.
    }
    func cricleViewDesign(view : UIView) {
        view.layer.cornerRadius = view.frame.size.height/2
        view.layer.cornerRadius = view.frame.size.height/2
        view.layer.cornerRadius = view.frame.size.height/2
    }
    
    func swipToRight(){
        let swipeToLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeSuccessAction))
        swipeToLeft.direction = .left
        self.view.addGestureRecognizer(swipeToLeft)
        
    }
    
    @objc func swipeSuccessAction(){
            let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            vc.modalPresentationStyle = .fullScreen
                   presentViewControllerWithTransition(viewController: vc, animated: true, direction: .fromRight)
       
       
    }
    
    func fristAnm()  {
        let view = StartAnimationView.showLottie(view: self.animationView, fileName: "loading", contentMode: .scaleAspectFill)
        view.play { (finished) in
            if finished {
                    if let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true, completion: nil)
                    }
                
            }
            
        }
    }
    
    
    @IBAction func skipBtnPressed(_ sender: UIButton) {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
                vc.modalPresentationStyle = .fullScreen
                present(vc, animated: true, completion: nil)
            }
       
    }
    
    
    
}


extension UIViewController: UITextFieldDelegate{
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          textField.resignFirstResponder()
          return true
      }
}

