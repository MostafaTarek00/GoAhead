//
//  MostAddedCollectionViewCell.swift
//  GoAhead
//
//  Created by Mustafa on 11/21/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit

class MostAddedCollectionViewCell: UICollectionViewCell {
     @IBOutlet weak var mostAddedImage: UIImageView!
     @IBOutlet weak var mostAddedName: UILabel!
     @IBOutlet weak var mostAddedBtn: UIButton!
     var offerID : String?
     
    
    func deleteOfferFromFavorites(){
        APIClient.deleteOfferFromFavorites(userId: UserDefault.getId(), OfferID: offerID ?? "") { (Result) in
            switch Result {
            case .success(let response):
                print(response)
                self.mostAddedBtn.setImage(UIImage(named: "favorite2"), for: .normal)
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
                self.mostAddedBtn.setImage(UIImage(named: "favorite1"), for: .normal)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    
    
    @IBAction func mostAddedImageFavBtnBressed(_ sender: UIButton) {
        if mostAddedBtn.image(for: .normal) == UIImage(named: "favorite1") {
            deleteOfferFromFavorites()
        } else if mostAddedBtn.image(for: .normal) == UIImage(named: "favorite2") {
            addOfferToFavorite()
        }
    }
    
}
