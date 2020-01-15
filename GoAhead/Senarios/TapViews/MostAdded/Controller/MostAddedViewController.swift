//
//  MostAddedViewController.swift
//  GoAhead
//
//  Created by Mustafa on 11/21/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

@available(iOS 13.0, *)
class MostAddedViewController: UIViewController ,NVActivityIndicatorViewable{
    var mostAdded:MostAdded?
    var offerID : String?
    @IBOutlet weak var mostAddCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        showNavigation()
        getMostOffersAdded()
        // Do any additional setup after loading the view.
    }
    
    func getMostOffersAdded(){
           self.startAnimating()
           APIClient.getMostOffersAdded(userId: UserDefault.getId()){ (Result) in
               switch Result {
               case .success(let response):
                   DispatchQueue.main.async {
                       self.stopAnimating()
                       self.mostAdded = response
                       self.mostAddCollectionView.reloadData()
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
extension MostAddedViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mostAdded?.offers.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MostAddedCollectionViewCell", for: indexPath) as! MostAddedCollectionViewCell
        cell.mostAddedImage.sd_setImage(with: URL(string: mostAdded?.offers[indexPath.item].image ?? ""), placeholderImage: UIImage(named: "logo GoAhead"))
        cell.mostAddedName.text = mostAdded?.offers[indexPath.item].name
        cell.offerID = mostAdded?.offers[indexPath.item].id
        if mostAdded?.offers[indexPath.item].favorite == 0 {
            cell.mostAddedBtn.setImage(UIImage(named: "favorite2"), for: .normal)
        }else if mostAdded?.offers[indexPath.item].favorite == 1 {
            cell.mostAddedBtn.setImage(UIImage(named: "favorite1"), for: .normal)
        }
        
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell
        , forItemAt indexPath: IndexPath) {
        if self.mostAddCollectionView.isDragging{
            cell.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
    
    
}



//MARK:-UICollectionViewDelegateFlowLayout

@available(iOS 13.0, *)
extension MostAddedViewController : UICollectionViewDelegateFlowLayout {
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
