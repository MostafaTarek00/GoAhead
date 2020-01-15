//
//  TotalItemCollectionViewCell.swift
//  GoAhead
//
//  Created by Mustafa on 11/21/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
class CatagoryCollectionViewCell: UICollectionViewCell,NVActivityIndicatorViewable{
    var addFavorite:AddAndDeleteFavoriteOffers?
    var offerId : String?
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemFav: UIButton!{
        didSet{
            itemFav.setImage(UIImage(named: "favorite2"), for: .normal)
        }
    }
    
    func deleteOfferFromFavorites(){
        APIClient.deleteOfferFromFavorites(userId: UserDefault.getId(), OfferID: offerId ?? "") { (Result) in
            switch Result {
            case .success(let response):
                print(response)
                self.itemFav.setImage(UIImage(named: "favorite2"), for: .normal)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func addOfferToFavorite(){
        APIClient.addOfferToFavorite(userId: UserDefault.getId(), OfferID: offerId ?? "") { (Result) in
            switch Result {
            case .success(let response):
                print(response)
                self.itemFav.setImage(UIImage(named: "favorite1"), for: .normal)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    @IBAction func itemFavBtnBressed(_ sender: UIButton) {
        if itemFav.image(for: .normal) == UIImage(named: "favorite1") {
            deleteOfferFromFavorites()
        } else if itemFav.image(for: .normal) == UIImage(named: "favorite2") {
            
            addOfferToFavorite()
        }
        
    }
    
}
