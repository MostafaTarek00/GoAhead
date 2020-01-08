//
//  OfferViewController.swift
//  GoAhead
//
//  Created by Mustafa on 11/21/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

@available(iOS 13.0, *)
class OfferViewController: UIViewController ,NVActivityIndicatorViewable{
    var offers:Offers?
    
    
    @IBOutlet weak var offerCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNavigation()
        getAllOffers()
        
        // Do any additional setup after loading the view.
    }
    
    
    func getAllOffers(){
        self.startAnimating()
        APIClient.getOffers(userId: UserDefault.getId()){ (Result) in
            switch Result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.stopAnimating()
                    self.offers = response
                    self.offerCollectionView.reloadData()
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


@available(iOS 13.0, *)
extension OfferViewController: UICollectionViewDelegate,UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  offers?.offers.count ?? 0
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OffersCollectionViewCell", for: indexPath)
            as! OffersCollectionViewCell
        cell.offersImage.sd_setImage(with: URL(string: offers?.offers[indexPath.item].image ?? ""), placeholderImage: UIImage(named: "logo GoAhead"))
        cell.offersName.text = offers?.offers[indexPath.item].name
        if offers?.offers[indexPath.item].favorite == 0 {
            cell.offerFavBtn.setImage(UIImage(named: "favorite2"), for: .normal)
        }else if offers?.offers[indexPath.item].favorite == 1 {
            cell.offerFavBtn.setImage(UIImage(named: "favorite1"), for: .normal)
        }
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell
        , forItemAt indexPath: IndexPath) {
        if self.offerCollectionView.isDragging{
            cell.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
}



//MARK:-UICollectionViewDelegateFlowLayout

@available(iOS 13.0, *)
extension OfferViewController : UICollectionViewDelegateFlowLayout {
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
