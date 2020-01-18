//
//  SearchProductViewController.swift
//  GoAhead
//
//  Created by Mustafa on 1/13/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
@available(iOS 13.0, *)
class SearchProductViewController: UIViewController ,NVActivityIndicatorViewable{
    var searchProduct:SearchProduct?
    var failure:Failure?
    var searchText : String?
    @IBOutlet weak var productCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        showAndBacNavigation()
        getsearchProduct()
        
        // Do any additional setup after loading the view.
    }
    
    
    func getsearchProduct(){
        self.startAnimating()
        if let searchText = searchText {
            APIClient.searchForProduct(searchText: searchText) { (Result) in
                switch Result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self.stopAnimating()
                        self.searchProduct = response
                        self.productCollectionView.reloadData()
                        print(response)
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.stopAnimating()
                        print(error.localizedDescription)
                        APIClient.searchForProductFailure(searchText: searchText) { (Result) in
                            switch Result {
                            case .success(let response):
                                DispatchQueue.main.async {
                                    self.failure = response
                                    print(response)
                                    self.stopAnimating()
                                    Alert.show("Error", massege: self.failure!.message, context: self)
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




@available(iOS 13.0, *)
extension SearchProductViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return searchProduct?.products.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchProductCollectionViewCell", for: indexPath) as! SearchProductCollectionViewCell
        
        cell.productImage.sd_setImage(with: URL(string: searchProduct?.products[indexPath.item].image ?? ""), placeholderImage: UIImage(named: "logo GoAhead"))
        cell.productTitle.text = searchProduct?.products[indexPath.item].title
        cell.productDes.text = ""
        cell.productPrice.text = searchProduct?.products[indexPath.item].price
        
        return cell
        
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let vc = storyboard?.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
        
        vc.modalPresentationStyle = .fullScreen
        vc.ProId = searchProduct?.products[indexPath.item].id
        navigationController?.pushViewController(vc, animated: true)
        
        
        
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

@available(iOS 13.0, *)
extension SearchProductViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let cellSize = CGSize(width: self.view.frame.width/1-20 , height: 250)
        return cellSize
    }
}
