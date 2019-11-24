//
//  OfferViewController.swift
//  GoAhead
//
//  Created by Mustafa on 11/21/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class OfferViewController: UIViewController {

    @IBOutlet weak var offerCollectionView: UICollectionView!
    
    var array2 = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
     var large: [Int]?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

 

    @IBAction func itemPressed(_ sender: UIBarButtonItem) {
        let sMenu = storyboard?.instantiateViewController(identifier: "SideMenuNavigationController")
        sMenu?.modalPresentationStyle = .fullScreen
        present(sMenu!, animated: true, completion: nil)
        
    }
}


@available(iOS 13.0, *)
extension OfferViewController: UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array2.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OffersCollectionViewCell", for: indexPath) as! OffersCollectionViewCell
         cell.offersName.text = "aaaaaaaaaaaaa"
        return cell
    }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    large = array2.filter{ $0 % 5 == 0 }
    for i in large!.indices {
        if indexPath.row == large![i] {
            return CGSize(width: collectionView.bounds.width/1 , height: collectionView.bounds.width/2-30)
        }
    }
        return CGSize(width: view.bounds.width/2-10 , height: view.bounds.width/2-60)
  }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if self.offerCollectionView.isDragging{
            cell.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
}











