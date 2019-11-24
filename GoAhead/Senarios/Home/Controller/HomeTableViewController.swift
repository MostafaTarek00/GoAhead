//
//  HomeTableViewController.swift
//  GoAhead
//
//  Created by Mustafa on 11/21/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit
import SDWebImage
@available(iOS 13.0, *)
class HomeTableViewController: UITableViewController {
    
    var categories: [Category]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 150
        //tableView.rowHeight = UITableView.automaticDimension
       getData()
    }
    
    func getData(){
        APIClient.getAllCategories { (Result) in
            switch Result {
            case .success(let response):
                print(response)
                self.categories = response.categories
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    @IBAction func menuBtnPressed(_ sender: UIBarButtonItem) {
        let sMenu = storyboard?.instantiateViewController(identifier: "SideMenuNavigationController")
               sMenu?.modalPresentationStyle = .fullScreen
               present(sMenu!, animated: true, completion: nil)
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories?.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let  cell = tableView.dequeueReusableCell(withIdentifier: "CategoryHomeTableViewCell", for: indexPath) as! CategoryHomeTableViewCell
        
        if let category = categories?[indexPath.row] {
            cell.categoryHomeImage.sd_setImage(with: URL(string: category.image) , placeholderImage: UIImage(named: ""))
            cell.categoryHomeNam.setTitle(category.name, for: .normal)
        }
        return cell
     }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(identifier: "TotalItemsViewController") as! TotalItemsViewController
        vc.modalPresentationStyle = .fullScreen
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
