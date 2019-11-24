//
//  ColleDetailsOtherProduct.swift
//  GoAhead
//
//  Created by Maged on 3/25/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit

extension details: UICollectionViewDelegate,UICollectionViewDataSource
{
    func getDataForProducts(SellerId:String)
    {
        netWorking.GetUserProducts(id: SellerId) { (Products:[productsData]?) in
            if let products = Products
            {
                self.myProducts = products
                DispatchQueue.main.async {
                    self.otherProdects.reloadData()
                }
            }
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.myProducts.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:otherProdectsCell = otherProdects.dequeueReusableCell(withReuseIdentifier: "otherProdectsCell", for: indexPath) as! otherProdectsCell
        
        cell.productName.text = self.myProducts[indexPath.row].name
        let url = URL(string: self.myProducts[indexPath.row].image!)
        cell.productImage.pin_setImage(from: url)
        cell.productDescrpition.text = self.myProducts[indexPath.row].description
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if self.otherProdects.isDragging{
            
            cell.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let id = self.myProducts[indexPath.row].id {
            self.getData(id: id )
            self.ItemsSlider.removeAll()
            self.indicator.startAnimating()
            self.view.layoutIfNeeded()
        }
        
    }
    
}
