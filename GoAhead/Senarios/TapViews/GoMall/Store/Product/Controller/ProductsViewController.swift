//
//  ProductsViewController.swift
//  GoAhead
//
//  Created by Mustafa on 1/1/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
class ProductsViewController: UIViewController ,NVActivityIndicatorViewable {
    var catIdOfMall : Int?
    var productStoreOfCategory:ProductStoreOfCategory?
    var sellerId : String?
    var allProduct : AllProduct?
    var failure:Failure?
    var type : Int = 1
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            showAndBacNavigation()
        } else {
            // Fallback on earlier versions
        }
        if type == 1 {
            getAllProductByCategory()
        }else {
            getAllProduct()
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    func getAllProductByCategory(){
        self.startAnimating()
        if let catStoreId = catIdOfMall {
            APIClient.getAllProductInStoreByCategory(categoryID: catStoreId){ (Result) in
                switch Result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self.stopAnimating()
                        self.productStoreOfCategory = response
                        self.productCollectionView.reloadData()
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
    
    func getAllProduct(){
        self.startAnimating()
        if let sellerId = sellerId {
            APIClient.getAllProductInStore(sellerId: sellerId){ (Result) in
                switch Result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self.stopAnimating()
                        self.allProduct = response
                        if self.allProduct?.products != nil {
                            self.productCollectionView.reloadData()
                        }else {
                            Alert.show(NSLocalizedString("Error", comment: ""), massege: "There Are No Products", context: self)
                        }
                        print(response)
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.stopAnimating()
                        print(error.localizedDescription)
                        APIClient.getAllProductInStoreFailure(sellerId: sellerId){ (Result) in
                            switch Result {
                            case .success(let response):
                                DispatchQueue.main.async {
                                    self.stopAnimating()
                                    self.failure = response
                                    Alert.show(NSLocalizedString("Error", comment: ""), massege: self.failure!.message, context: self)
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
        }
    }
    
    
}


extension ProductsViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if type == 1 {
            return productStoreOfCategory?.offers.count ?? 0
        }else {
            return allProduct?.products?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCollectionViewCell", for: indexPath) as! ProductsCollectionViewCell
        if type == 1{
            cell.productImage.sd_setImage(with: URL(string: productStoreOfCategory?.offers[indexPath.item].image ?? ""), placeholderImage: UIImage(named: "logo GoAhead"))
            cell.productTitle.text = productStoreOfCategory?.offers[indexPath.item].name
            cell.productDes.text = productStoreOfCategory?.offers[indexPath.item].offerDescription
            cell.productPrice.text = productStoreOfCategory?.offers[indexPath.item].price
            
            return cell
        }else {
            cell.productImage.sd_setImage(with: URL(string: allProduct?.products?[indexPath.item].image ?? ""), placeholderImage: UIImage(named: "logo GoAhead"))
            cell.productTitle.text = allProduct?.products?[indexPath.item].name
            cell.productDes.text = allProduct?.products?[indexPath.item].productDescription
            cell.productPrice.text = allProduct?.products?[indexPath.item].price
            
            return cell
        }
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
            if type == 1 {
                vc.modalPresentationStyle = .fullScreen
                vc.ProId = productStoreOfCategory?.offers[indexPath.item].id
                navigationController?.pushViewController(vc, animated: true)
            }else {
                vc.modalPresentationStyle = .fullScreen
                vc.ProId = allProduct?.products?[indexPath.item].id
                navigationController?.pushViewController(vc, animated: true)
            }
        } else {
            // Fallback on earlier versions
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if self.productCollectionView.isDragging{
            cell.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
    
    
    
}

extension ProductsViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let cellSize = CGSize(width: self.view.frame.width/1-20 , height: 250)
        return cellSize
    }
}
