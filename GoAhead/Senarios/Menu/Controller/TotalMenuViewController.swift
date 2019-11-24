//
//  TotalMenuViewController.swift
//  GoAhead
//
//  Created by Mustafa on 11/21/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit

class TotalMenuViewController: UIViewController {
       var dataMenu = ["Log in" , "Home" , "Chat" , "FootBall" ]

    @IBOutlet weak var menuTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}

extension TotalMenuViewController : UITableViewDataSource , UITableViewDelegate {
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return dataMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "menuBtnTableViewCell", for: indexPath) as! menuBtnTableViewCell
             
        cell.categoryLbl.text = dataMenu[indexPath.row]

             
             return cell
    }
    
    

}
