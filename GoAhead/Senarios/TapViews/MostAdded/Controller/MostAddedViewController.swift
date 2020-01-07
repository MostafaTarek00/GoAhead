//
//  MostAddedViewController.swift
//  GoAhead
//
//  Created by Mustafa on 11/21/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class MostAddedViewController: UIViewController {
    var imageTest = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20",
"21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40",
"41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60",
"61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80",
"81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100"]
    
    @IBOutlet weak var mostAddCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        showNavigation()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
}
@available(iOS 13.0, *)
extension MostAddedViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MostAddedCollectionViewCell", for: indexPath) as! MostAddedCollectionViewCell
        cell.mostAddedImage.image = UIImage(named: imageTest[indexPath.item])

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
