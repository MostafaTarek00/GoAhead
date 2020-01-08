//
//  TotalItemCollectionViewCell.swift
//  GoAhead
//
//  Created by Mustafa on 11/21/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
protocol ReloadCollectionDelegate {
    func realoadFavOffer()
}
class CatagoryCollectionViewCell: UICollectionViewCell,NVActivityIndicatorViewable{
    var addFavorite:AddAndDeleteFavoriteOffers?
    var delegate: ReloadCollectionDelegate?
    var offerId : String?
    var offerIdFav : Int?
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemFav: UIButton!{
        didSet{
            itemFav.setImage(UIImage(named: "favorite2"), for: .normal)
            
        }
    }
    
    func deleteOfferFromFavorites(){
        APIClient.deleteOfferFromFavorites(userId: UserDefault.getId(), OfferID: offerId!)
        { (Result) in
            switch Result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.addFavorite = response
                    let collection = self.superview as! UICollectionView
                    collection.reloadData()
                    //  self.itemOfCatogoryCollectionView.reloadData()
                    print(response)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func addOfferToFavorite(){
        APIClient.addOfferToFavorite(userId: UserDefault.getId(), OfferID: offerId!)
        { (Result) in
            switch Result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.addFavorite = response
                    let collection = self.superview as! UICollectionView
                    collection.reloadData()
                    print(response)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func itemFavBtnBressed(_ sender: UIButton) {
        if offerIdFav == 0 {
            addOfferToFavorite()
            delegate?.realoadFavOffer()
        } else if offerIdFav == 1 {
            deleteOfferFromFavorites()
            delegate?.realoadFavOffer()
        }
    }
    
}
