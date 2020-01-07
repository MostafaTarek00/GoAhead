//
//  SellerViewController.swift
//  GoAhead
//
//  Created by Mustafa on 1/2/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SellerViewController: UIViewController {
    
    @IBOutlet weak var sellerImage: UIImageView!{
        didSet{
            Rounded.roundedImage(imageView: sellerImage)
            /*
            sellerImage.layer.cornerRadius = sellerImage.frame.size.height / 2
            sellerImage.clipsToBounds = true
 */
        }
    }
    @IBOutlet weak var sellerName: UILabel!
    @IBOutlet weak var sellerPhone: UILabel!
    @IBOutlet weak var sellerMail: UILabel!
    @IBOutlet weak var otherProductCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAndBacNavigation()
        // Do any additional setup after loading the view.
    }
    
    
    
    
}

@available(iOS 13.0, *)
extension SellerViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OtherProductCollectionViewCell", for: indexPath) as! OtherProductCollectionViewCell
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
            let vc = storyboard?.instantiateViewController(identifier: "ProductsViewController") as! ProductsViewController
            vc.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(vc, animated: true)
      
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if self.otherProductCollectionView.isDragging{
            cell.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
    
    
    
    
}



@available(iOS 13.0, *)
extension SellerViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let cellSize = CGSize(width: self.view.frame.width / 2 - 15 , height: 330)
        return cellSize
    }
    
    
    
    
    
}













