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
class HomeViewController: UIViewController {
    
    @IBOutlet weak var departmentCollectionView: UICollectionView!
    var categories: [Category]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
       getData()
    }
    
    func getData(){
        APIClient.getAllCategories { (Result) in
            switch Result {
            case .success(let response):
                print(response)
                self.categories = response.categories
                self.departmentCollectionView.reloadData()
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
    
    

}

@available(iOS 13.0, *)
extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryHomeCollectionViewCell", for: indexPath) as! CategoryHomeCollectionViewCell
            if let category = categories?[indexPath.row] {
                      cell.categoryHomeImage.sd_setImage(with: URL(string: category.image) , placeholderImage: UIImage(named: ""))
                      cell.categoryHomeName.text = category.name
                  }
            return cell
       
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
               let vc = storyboard?.instantiateViewController(identifier: "TotalItemsViewController") as! TotalItemsViewController
               vc.modalPresentationStyle = .fullScreen
               navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
}
