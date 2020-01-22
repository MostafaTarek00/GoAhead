//
//  SellerViewController.swift
//  GoAhead
//
//  Created by Mustafa on 1/2/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
@available(iOS 13.0, *)
class SellerViewController: UIViewController ,NVActivityIndicatorViewable {
    var sellerDetails:SellerDetails?
    var sellerId : String?
    
    @IBOutlet weak var sellerImage: UIImageView!{
        didSet{
            Rounded.roundedImage(imageView: sellerImage)
        }
    }
    @IBOutlet weak var sellerName: UILabel!
    @IBOutlet weak var sellerPhone: UILabel!
    @IBOutlet weak var sellerMail: UILabel!
    @IBOutlet weak var otherProductCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAndBacNavigation()
        getDateOfSeller()
        // Do any additional setup after loading the view.
    }
    
    func getDateOfSeller(){
        if let sellerId = sellerId {
        self.startAnimating()
        APIClient.getSellerDetails(sellerId: sellerId){ (Result) in
            switch Result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.stopAnimating()
                    self.sellerDetails = response
                    self.otherProductCollectionView.reloadData()
                    self.updateDate()
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
    
    func updateDate()  {
        sellerImage.sd_setImage(with: URL(string: sellerDetails?.photo ?? ""), placeholderImage: UIImage(named: "person1"))
        sellerName.text = sellerDetails?.name
        sellerPhone.text = sellerDetails?.phone
        sellerMail.text = sellerDetails?.mail


        
    }
    
    
    
    
    
    
}

@available(iOS 13.0, *)
extension SellerViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sellerDetails?.products.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OtherProductCollectionViewCell", for: indexPath) as! OtherProductCollectionViewCell
        cell.productImage.sd_setImage(with: URL(string: sellerDetails?.products[indexPath.item].image ?? ""), placeholderImage: UIImage(named: "logo GoAhead"))
        cell.productName.text = sellerDetails?.products[indexPath.item].name
        cell.productDes.text = sellerDetails?.products[indexPath.item].productDescription
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
            let vc = storyboard?.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
            vc.modalPresentationStyle = .fullScreen
            vc.ProId = sellerDetails?.products[indexPath.item].id
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













