//
//  OffersCollectionViewCell.swift
//  GoAhead
//
//  Created by Mustafa on 11/21/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit

//protocol AddOfferToFavourites {
//    func update
//}

class OffersCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var offersImage: UIImageView!
    @IBOutlet weak var offersName: UILabel!
    @IBOutlet weak var offerFavBtn: UIButton!
    
    var offerID : String?
    
    func deleteOfferFromFavorites(){
        APIClient.deleteOfferFromFavorites(userId: UserDefault.getId(), OfferID: offerID ?? "") { (Result) in
            switch Result {
            case .success(let response):
                print(response)
                self.offerFavBtn.setImage(UIImage(named: "favorite2"), for: .normal)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func addOfferToFavorite(){
        APIClient.addOfferToFavorite(userId: UserDefault.getId(), OfferID: offerID ?? "") { (Result) in
            switch Result {
            case .success(let response):
                print(response)
                self.offerFavBtn.setImage(UIImage(named: "favorite1"), for: .normal)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    @IBAction func offerFavBtnBressed(_ sender: UIButton) {
        if offerFavBtn.image(for: .normal) == UIImage(named: "favorite1") {
            deleteOfferFromFavorites()
        } else if offerFavBtn.image(for: .normal) == UIImage(named: "favorite2") {
            addOfferToFavorite()
        }
    }
    
}
