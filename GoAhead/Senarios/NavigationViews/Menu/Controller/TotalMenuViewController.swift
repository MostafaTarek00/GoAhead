//
//  TotalMenuViewController.swift
//  GoAhead
//
//  Created by Mustafa on 11/21/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit

class TotalMenuViewController: UIViewController {
    
    var menuArray = ["Travel and Tourism","Restaurants","General Services","Online Shopping","Electronic","Food Stuffs","Pharmacies","Courses and Education","Cars","News andSports","Government","Banks$Installment Companies","Athekry","Jewelery","Fashion","Furnituer And Home","Saudi Clubs"]
    
    @IBOutlet weak var headerProfileView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var myNameLbl: UILabel!
    
    @IBOutlet weak var changLang: UIButton!
    
    
    
    
    @IBOutlet weak var menuTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
  
    
    
    @IBAction func logOutBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func changeLangPressed(_ sender: UIButton) {
    }
}

extension TotalMenuViewController : UITableViewDataSource , UITableViewDelegate {
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  menuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "menuBtnTableViewCell", for: indexPath) as! menuBtnTableViewCell
             return cell
    }
    
    

}
