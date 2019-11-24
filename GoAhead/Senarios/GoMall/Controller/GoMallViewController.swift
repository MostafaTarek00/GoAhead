//
//  GoMallViewController.swift
//  GoAhead
//
//  Created by Mustafa on 11/21/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class GoMallViewController: UIViewController {

    @IBOutlet weak var goMallCollectionView: UICollectionView!
    
    var categories:[ProductCategory]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        getData()
    }
    
    func getData() {
        APIClient.getAllProductCategories { (Result) in
            switch Result {
            case .success(let response):
                print(response)
                self.categories = response.categories
                self.goMallCollectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    @IBAction func searchBtnPressed(_ sender: UIBarButtonItem) {
    }
    @IBAction func cartBtnPressed(_ sender: UIBarButtonItem) {
    }
    @IBAction func menuBtnPressed(_ sender: UIBarButtonItem) {
        let sMenu = storyboard?.instantiateViewController(identifier: "SideMenuNavigationController")
        sMenu?.modalPresentationStyle = .fullScreen
        present(sMenu!, animated: true, completion: nil)
    }
}


@available(iOS 13.0, *)
extension GoMallViewController: UICollectionViewDelegate,UICollectionViewDataSource {
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GoMallCollectionViewCell", for: indexPath) as! GoMallCollectionViewCell
        if let category = categories?[indexPath.row] {
            cell.goMallImage.sd_setImage(with: URL(string: category.image), placeholderImage: UIImage(named: "") )
            cell.goMallName.setTitle(category.name, for: .normal)
        }
        return cell
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = storyboard?.instantiateViewController(identifier: "") as?
//    }
    

}












