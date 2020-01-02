//
//  SearchViewController.swift
//  GoAhead
//
//  Created by Mustafa on 1/2/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit
import BEMCheckBox

class SearchViewController: UIViewController {

    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var popupView: UIView!{
        didSet{
           popupView.layer.cornerRadius = 20
           popupView.clipsToBounds = true
        }
    }
    @IBOutlet  var search: [BEMCheckBox]!
    @IBOutlet weak var searchTextF: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tabToClosePopup))
        bigView.addGestureRecognizer(tapGesture)
        updateViewDesign()
      

        // Do any additional setup after loading the view.
    }
    

    
    func updateViewDesign() {
        
        CustomDesign.customTextFaild(textField: searchTextF)
        
    }
    
    @objc func tabToClosePopup()  {
      dismiss(animated: true, completion: nil)
    }
    

    
    @IBAction func searchCheck(_ sender: BEMCheckBox) {
        if sender.tag == 1 {
            search[1].on = false
            search[2].on = false
        } else if sender.tag == 2{
            search[0].on = false
            search[2].on = false
        }else {
            search[0].on = false
            search[1].on = false
        }
    }
    
    
    @IBAction func searchBtnPressed(_ sender: UIButton) {
    }
    
}
