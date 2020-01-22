//
//  SearchViewController.swift
//  GoAhead
//
//  Created by Mustafa on 1/2/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit
import BEMCheckBox
protocol SearchCategoryDelegate {
    func transferResultCat( text : String)
    func transferResultSeller( text : String)
    func transferResultProduct( text : String)
}

class SearchViewController: UIViewController {

    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var popupView: UIView!{
        didSet{
           popupView.layer.cornerRadius = 20
           popupView.clipsToBounds = true
        }
    }
    @IBOutlet  var search: [BEMCheckBox]!
    @IBOutlet weak var searchTextF: UITextField!{
        didSet{
            searchTextF.delegate = self
            searchTextF.isSecureTextEntry = false
        }
        
    }
    @IBOutlet weak var searchBtnPress: UIButton!
    var searchType : Int?
    var d : SearchCategoryDelegate?
    var mainNavigationController: MainNavigationController?
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
            searchType = 1
            search[1].on = false
            search[2].on = false
        } else if sender.tag == 2{
            searchType = 2
            search[0].on = false
            search[2].on = false
        }else {
            searchType = 3
            search[0].on = false
            search[1].on = false
        }
    }
    
    
    @IBAction func searchBtnPressed(_ sender: UIButton) {
        if searchType == 1  {
            self.dismiss(animated: true, completion: nil)
            d?.transferResultCat(text: searchTextF.text ?? "")
        }else if searchType == 2  {
            self.dismiss(animated: true, completion: nil)
            d?.transferResultSeller(text: searchTextF.text ?? "")
        }else if searchType == 3  {
            self.dismiss(animated: true, completion: nil)
            d?.transferResultProduct(text: searchTextF.text ?? "")
        }
}
}
