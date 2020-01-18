//
//  SearchCategoryViewController.swift
//  GoAhead
//
//  Created by Mustafa on 1/12/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
@available(iOS 13.0, *)
class SearchCategoryViewController: UIViewController ,NVActivityIndicatorViewable {
    var searchCategories:SearchCategories?
    var failure:Failure?
    var searchText : String?
    @IBOutlet weak var searchCatCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        showAndBacNavigation()
        getsearchCategories()
        
        // Do any additional setup after loading the view.
    }
    
    
    func getsearchCategories(){
        self.startAnimating()
        if let searchText = searchText {
            
            APIClient.searchForCategory(searchText: searchText) { (Result) in
                switch Result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self.stopAnimating()
                        self.searchCategories = response
                        self.searchCatCollectionView.reloadData()
                        print(response)
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.stopAnimating()
                        print(error.localizedDescription)
                        APIClient.searchForCategoryFailure(searchText: searchText) { (Result) in
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
extension SearchCategoryViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchCategories?.categories.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCategoryCollectionViewCell", for: indexPath) as! SearchCategoryCollectionViewCell
        cell.searchCatImage.sd_setImage(with: URL(string: searchCategories?.categories[indexPath.item].image ?? ""), placeholderImage: UIImage(named: "logo GoAhead"))
        cell.searchCatLbl.text = searchCategories?.categories[indexPath.item].name
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(identifier: "StoresOfMallViewController") as! StoresOfMallViewController
        vc.modalPresentationStyle = .fullScreen
        vc.catIdOfMall = searchCategories?.categories[indexPath.item].id
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if self.searchCatCollectionView.isDragging{
            cell.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
    
    
    
    
}


@available(iOS 13.0, *)
extension SearchCategoryViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let cellSize = CGSize(width: self.view.frame.width / 2 - 15 , height: 180)
        return cellSize
    }
    
    
    
    
    
}











