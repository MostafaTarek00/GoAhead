//
//  MostAddedViewController.swift
//  GoAhead
//
//  Created by Mustafa on 11/21/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class MostAddedViewController: UIViewController ,NVActivityIndicatorViewable{
    
    @IBOutlet weak var mostAddCollectionView: UICollectionView!
    @IBOutlet weak var imageSlider: UIScrollView!
    @IBOutlet weak var imageSliderViewHeight: NSLayoutConstraint!
    
    var mostAdded:MostAdded?
    var offerID : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageSliderViewHeight.constant = view.frame.size.height/5
        imageSlider.auk.setupSlider(images: ["1" , "2" , "3"])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        showNavigation()
        getMostOffersAdded()

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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "WebSiteDeatils2ViewController") as? WebSiteDeatils2ViewController {
                  vc.imageLink = mostAdded?.offers[indexPath.item].image
                  vc.nameText =  mostAdded?.offers[indexPath.item].name
                  vc.url = mostAdded?.offers[indexPath.item].link
                  vc.favorite =  mostAdded?.offers[indexPath.item].favorite

                  vc.modalPresentationStyle = .fullScreen
                  navigationController?.pushViewController(vc, animated: true)
              }
        
           
      
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
