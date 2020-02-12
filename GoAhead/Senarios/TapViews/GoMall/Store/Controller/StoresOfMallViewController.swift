//
//  ProductOfMallViewController.swift
//  GoAhead
//
//  Created by Mustafa on 11/24/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
class StoresOfMallViewController: UIViewController ,NVActivityIndicatorViewable{
    
    var catIdOfMall : String?
    var storeSeller:StoreSeller?
    @IBOutlet weak var storCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
            showAndBacNavigation()
           getAllStoresOfMall()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(true)
           showAndBacNavigation()
       }
    
    
    func getAllStoresOfMall(){
        self.startAnimating()
        if let catStoreId = catIdOfMall {
            APIClient.getAllSellersByCategory(categoryID: catStoreId){ (Result) in
                switch Result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self.stopAnimating()
                        self.storeSeller = response
                        self.storCollectionView.reloadData()
                        print(response)
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.stopAnimating()
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    
}

extension StoresOfMallViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return storeSeller?.sellers.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoresOfMallCollectionViewCell", for: indexPath) as! StoresOfMallCollectionViewCell
        
        cell.storeImage.sd_setImage(with: URL(string: storeSeller?.sellers[indexPath.item].image ?? ""), placeholderImage: UIImage(named: "person1"))
        cell.storeName.text = storeSeller?.sellers[indexPath.item].name
        return cell
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
            let vc = storyboard?.instantiateViewController(withIdentifier: "ProductsViewController") as! ProductsViewController
            vc.modalPresentationStyle = .fullScreen
            vc.catIdOfMall = storeSeller?.sellers[indexPath.item].idCategory
            navigationController?.pushViewController(vc, animated: true)
       
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if self.storCollectionView.isDragging{
            cell.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
    
    
    
    
}


extension StoresOfMallViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let cellSize = CGSize(width: self.view.frame.width / 2 - 15 , height: 150)
        return cellSize
    }
    
    
    
    
    
}





