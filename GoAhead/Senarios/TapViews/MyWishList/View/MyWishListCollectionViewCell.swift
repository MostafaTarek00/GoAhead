//
//  MyWishListCollectionViewCell.swift
//  GoAhead
//
//  Created by Mustafa on 11/21/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit
protocol ReloadData {
    func reload()
}

class MyWishListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var wishListImage: UIImageView!
    @IBOutlet weak var wishListName: UILabel!
    @IBOutlet weak var wishListFavBtn: UIButton!
    var offerID : String?
    var delegate : ReloadData?
    
    
    
    func deleteOfferFromFavorites(){
        APIClient.deleteOfferFromFavorites(userId: UserDefault.getId(), OfferID: offerID ?? "") { (Result) in
            switch Result {
            case .success(let response):
             /*   let collection = self.superview as! UICollectionView
                collection.reloadData()
 */
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
       
       
       
       @IBAction func wishListFavBtnBressed(_ sender: UIButton) {
        deleteOfferFromFavorites()
        delegate?.reload()
       }
       
    
}
