//
//  MyWishListViewController.swift
//  GoAhead
//
//  Created by Mustafa on 11/21/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class MyWishListViewController: UIViewController , NVActivityIndicatorViewable {
    
    @IBOutlet weak var imageSliderViewHeight: NSLayoutConstraint!
    @IBOutlet weak var imageSlider: UIScrollView!
    @IBOutlet weak var myWishListCollectionView: UICollectionView!
    
    var myWishList:MyWishList?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageSliderViewHeight.constant = view.frame.size.height / 5
        imageSlider.auk.setupSlider(images: ["1" , "2" , "3"])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        showNavigation()
        getUserFavoriteOffers()


    }
    
    
    
    func getUserFavoriteOffers(){
        self.startAnimating()
        APIClient.getUserFavoriteOffers(userId: UserDefault.getId()){ (Result) in
            switch Result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.stopAnimating()
                    self.myWishList = response
                    self.myWishListCollectionView.reloadData()
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

extension MyWishListViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myWishList?.offers.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyWishListCollectionViewCell", for: indexPath) as! MyWishListCollectionViewCell
        cell.wishListImage.sd_setImage(with: URL(string: myWishList?.offers[indexPath.item].image ?? ""), placeholderImage: UIImage(named: "logo GoAhead"))
        cell.wishListName.text = myWishList?.offers[indexPath.item].name
        cell.offerID = myWishList?.offers[indexPath.item].id
        if myWishList?.offers[indexPath.item].favorite == 0 {
            cell.wishListFavBtn.setImage(UIImage(named: "favorite2"), for: .normal)
        }else if myWishList?.offers[indexPath.item].favorite == 1 {
            cell.wishListFavBtn.setImage(UIImage(named: "favorite1"), for: .normal)
        }
        cell.delegate = self
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "WebSiteDeatils2ViewController") as? WebSiteDeatils2ViewController {
            vc.imageLink = myWishList?.offers[indexPath.item].image
            vc.nameText =  myWishList?.offers[indexPath.item].name
            vc.url = myWishList?.offers[indexPath.item].link
            vc.favorite =  myWishList?.offers[indexPath.item].favorite
            
            vc.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell
        , forItemAt indexPath: IndexPath) {
        if self.myWishListCollectionView.isDragging{
            cell.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
    
    
}


//MARK:-UICollectionViewDelegateFlowLayout

extension MyWishListViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
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
}

extension MyWishListViewController : ReloadData {
    func reload() {
        getUserFavoriteOffers()
    }
    
    
}
