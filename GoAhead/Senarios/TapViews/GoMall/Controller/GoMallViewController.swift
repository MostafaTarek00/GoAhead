//
//  GoMallViewController.swift
//  GoAhead
//
//  Created by Mustafa on 11/21/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
@available(iOS 13.0, *)
class GoMallViewController: UIViewController ,NVActivityIndicatorViewable{
    var categoryOfMall:CategoryOfMall?
   
    
    @IBOutlet weak var goMallCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNavigation()
        getAllCategoriesOfMall()
        
        
    }
   
    
    func getAllCategoriesOfMall(){
        self.startAnimating()
        APIClient.getAllProductCategories(){ (Result) in
            switch Result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.stopAnimating()
                    self.categoryOfMall = response
                    self.goMallCollectionView.reloadData()
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
extension GoMallViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryOfMall?.categories.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GoMallCollectionViewCell", for: indexPath) as! GoMallCollectionViewCell
        
        
        cell.goMallImage.sd_setImage(with: URL(string: categoryOfMall?.categories[indexPath.item].image ?? ""), placeholderImage: UIImage(named: "logo GoAhead"))
        cell.goMallLbl.text = categoryOfMall?.categories[indexPath.item].name
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(identifier: "StoresOfMallViewController") as! StoresOfMallViewController
        vc.modalPresentationStyle = .fullScreen
        vc.catIdOfMall = categoryOfMall?.categories[indexPath.item].id
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if self.goMallCollectionView.isDragging{
            cell.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
    
    
    
    
}


@available(iOS 13.0, *)
extension GoMallViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let cellSize = CGSize(width: self.view.frame.width / 2 - 15 , height: 180)
        return cellSize
    }
    
    
    
    
    
}











