//
//  SearchSellerViewController.swift
//  GoAhead
//
//  Created by Mustafa on 1/13/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
@available(iOS 13.0, *)
class SearchSellerViewController: UIViewController , NVActivityIndicatorViewable {
    var searchSellers:SearchSellers?
    var failure:Failure?
    var searchText : String?
    
    @IBOutlet weak var searchSellCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        showAndBacNavigation()
         getsearchSeller()
        // Do any additional setup after loading the view.
    }
  
 
    func getsearchSeller(){
       self.startAnimating()
        if let searchText = searchText {
            APIClient.searchForSeller(searchText: searchText) { (Result) in
                switch Result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self.stopAnimating()
                        self.searchSellers = response
                        self.searchSellCollectionView.reloadData()
                        print(response)
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.stopAnimating()
                        print(error.localizedDescription)
                        APIClient.searchForSellerFailure(searchText: searchText) { (Result) in
                            switch Result {
                            case .success(let response):
                                DispatchQueue.main.async {
                                    self.failure = response
                                    print(response)
                                    self.stopAnimating()
                                    Alert.show(NSLocalizedString("Error", comment: ""), massege: self.failure!.message, context: self)
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
extension SearchSellerViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return searchSellers?.sellers.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchSellerCollectionViewCell", for: indexPath) as! SearchSellerCollectionViewCell
        
        cell.storeImage.sd_setImage(with: URL(string: searchSellers?.sellers[indexPath.item].image ?? ""), placeholderImage: UIImage(named: "person1"))
        cell.storeName.text = searchSellers?.sellers[indexPath.item].name
        return cell
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let vc = storyboard?.instantiateViewController(identifier: "ProductsViewController") as! ProductsViewController
        vc.modalPresentationStyle = .fullScreen
        vc.type = 2
        vc.sellerId = searchSellers?.sellers[indexPath.item].id
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if self.searchSellCollectionView.isDragging{
            cell.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
    
    
    
    
}


@available(iOS 13.0, *)
extension SearchSellerViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let cellSize = CGSize(width: self.view.frame.width / 2 - 15 , height: 150)
        return cellSize
    }
    
    
    
    
    
}






