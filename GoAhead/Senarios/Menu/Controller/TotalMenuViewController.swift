//
//  TotalMenuViewController.swift
//  GoAhead
//
//  Created by Mustafa on 11/21/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit

class TotalMenuViewController: UIViewController {
    
    @IBOutlet weak var headerProfileView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var myNameLbl: UILabel!
    
    @IBOutlet weak var changLang: UIButton!
    
    
    
    var categories: [Category]?
    var user: UserData?
    
    @IBOutlet weak var menuTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewFromData()
    }
    
    func updateViewFromData(){
        
        categories = Shared.categories
        user = Shared.user
        
    }
    
    
    @IBAction func logOutBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func changeLangPressed(_ sender: UIButton) {
    }
}

extension TotalMenuViewController : UITableViewDataSource , UITableViewDelegate {
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "menuBtnTableViewCell", for: indexPath) as! menuBtnTableViewCell
             
        cell.categoryLbl.text = categories?[indexPath.row].name
        

             return cell
    }
    
    

}
