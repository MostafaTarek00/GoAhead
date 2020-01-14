//
//  CardViewController.swift
//  GoAhead
//
//  Created by Mustafa on 1/2/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class CardViewController: UIViewController {
    
    var imageTest = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20",
"21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40",
"41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60",
"61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80",
"81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100"]
    
    @IBOutlet weak var CardCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        showAndBacNavigation()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func proceedBtnPressed(_ sender: UIButton) {
       
            if let vc = storyboard?.instantiateViewController(identifier: "SellerViewController") as? SellerViewController {
                vc.modalPresentationStyle = .fullScreen
                navigationController?.pushViewController(vc, animated: true)
            }
      
    }
    
    
}


@available(iOS 13.0, *)
extension CardViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as! CardCollectionViewCell
        // cell.categoryHomeImage.image = UIImage(named: imageTest[indexPath.item])
        cell.price = 20
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        let vc = storyboard?.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
        vc.modalPresentationStyle = .fullScreen
        vc.ProId = "12"
        vc.flagBtn = true
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if self.CardCollectionView.isDragging{
            cell.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
    
    
    
    
    
    
}

@available(iOS 13.0, *)
extension CardViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let cellSize = CGSize(width: self.view.frame.width/1-20 , height: 250)
        return cellSize
    }
    
    
    
    
    
}
