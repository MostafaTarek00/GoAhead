//
//  TotalItemsViewController.swift
//  GoAhead
//
//  Created by Mustafa on 11/21/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

@available(iOS 13.0, *)
class CatagogryViewController: UIViewController ,NVActivityIndicatorViewable{
    var cat:Categories?
    var offersOfCat:OffersOfCategory?
    var failure:Failure?
    var addFavorite:AddAndDeleteFavoriteOffers?
    var test : String?
    
    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var itemOfCatogoryCollectionView: UICollectionView!
    
    var index : IndexPath?
    var catId : String?
    var offersIdOfCat:String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAndBacNavigation()
        getAllCategories()
        getViewCategoryWebsites(categoryID: catId!, userId: UserDefault.getId())
        
        
    }
   
    
    
    
    
    func getAllCategories(){
        self.startAnimating()
        APIClient.getAllCategories() { (Result) in
            switch Result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.stopAnimating()
                    self.cat = response
                    self.menuCollectionView.reloadData()
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
    
    func getViewCategoryWebsites(categoryID : String, userId : String ){
        self.startAnimating()
        APIClient.viewCategoryWebsites(categoryID: categoryID, userId: userId)
        { (Result) in
            switch Result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.stopAnimating()
                    self.offersOfCat = response
                    self.itemOfCatogoryCollectionView.reloadData()
                    print(response)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.stopAnimating()
                    print(error.localizedDescription)
                    APIClient.viewCategoryWebsitesfailure(categoryID: categoryID, userId: userId)
                    { (Result) in
                        switch Result {
                        case .success(let response):
                            DispatchQueue.main.async {
                                self.stopAnimating()
                                self.failure = response
                                self.itemOfCatogoryCollectionView.reloadData()
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

@available(iOS 13.0, *)
extension CatagogryViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return  cat?.categories.count ?? 0
        } else {
            return  offersOfCat?.offers.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as! MenuCollectionViewCell
            cell.menuItemName.text = cat?.categories[indexPath.item].name
            cell.lineView.backgroundColor = .clear
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatagoryCollectionViewCell", for: indexPath) as! CatagoryCollectionViewCell
            cell.itemImage.sd_setImage(with: URL(string: offersOfCat?.offers[indexPath.item].image ?? ""), placeholderImage: UIImage(named: "logo GoAhead"))
            cell.itemName.text = offersOfCat?.offers[indexPath.item].name
            cell.offerId = offersOfCat?.offers[indexPath.item].id
            if offersOfCat?.offers[indexPath.item].favorite == 0 {
                cell.itemFav.setImage(UIImage(named: "favorite2"), for: .normal)
            }else if offersOfCat?.offers[indexPath.item].favorite == 1 {
                cell.itemFav.setImage(UIImage(named: "favorite1"), for: .normal)
            }
            return cell
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView.tag == 1{
            if let cell = collectionView.cellForItem(at: indexPath) as? MenuCollectionViewCell {
                cell.lineView.backgroundColor = .white
                getViewCategoryWebsites(categoryID: ((cat?.categories[indexPath.item].id)!), userId: UserDefault.getId())
                catId = ((cat?.categories[indexPath.item].id)!)
            }
        }else {
            
            
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        if collectionView.tag == 1{
            if let cell = collectionView.cellForItem(at: indexPath) as? MenuCollectionViewCell {
                cell.lineView.backgroundColor = .clear
            }
        }else {
            if let vc = storyboard?.instantiateViewController(identifier: "BrowserViewController") as? BrowserViewController {
                vc.url = offersOfCat?.offers[indexPath.item].link
                vc.modalPresentationStyle = .fullScreen
                present(vc, animated: true, completion: nil)
            }
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if self.itemOfCatogoryCollectionView.isDragging{
            cell.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
}


//MARK:-UICollectionViewDelegateFlowLayout

@available(iOS 13.0, *)
extension CatagogryViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        
        if collectionView.tag == 1{
            
        }else {
            if indexPath.row % 5 == 0 {
                print("\(indexPath.row) is even number")
                let cellSize = CGSize(width: collectionView.bounds.width/1-10 , height: 180)
                return cellSize
            } else {
                print("\(indexPath.row) is odd number")
                let cellSize = CGSize(width: collectionView.bounds.width/2-10 , height:  150)
                
                return cellSize
            }
        }
        let cellSize = CGSize(width: collectionView.bounds.width , height:  60)
        
        return cellSize
    }
}


