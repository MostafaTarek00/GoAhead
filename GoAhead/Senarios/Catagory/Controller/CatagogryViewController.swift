//
//  TotalItemsViewController.swift
//  GoAhead
//
//  Created by Mustafa on 11/21/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit

class CatagogryViewController: UIViewController {
     var menuArray = ["Travel and Tourism","Restaurants","General Services","Online Shopping","Electronic","Food Stuffs","Pharmacies","Courses and Education","Cars","News andSports","Government","Banks$Installment Companies","Athekry","Jewelery","Fashion","Furnituer And Home","Saudi Clubs"]
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var itemOfCatogoryCollectionView: UICollectionView!
    
    var index : IndexPath?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
   
    
    
}

extension CatagogryViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return menuArray.count
        } else {
            return 100
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as! MenuCollectionViewCell
            cell.menuItemName.text = menuArray[indexPath.row]
            cell.lineView.backgroundColor = .clear
         
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatagoryCollectionViewCell", for: indexPath) as! CatagoryCollectionViewCell
            
            return cell
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if #available(iOS 13.0, *) {
            if collectionView.tag == 1{
                if let cell = collectionView.cellForItem(at: indexPath) as? MenuCollectionViewCell {
                cell.lineView.backgroundColor = .white
                }
            }else {
                let vc = storyboard?.instantiateViewController(identifier: "DetailsOfItemsViewController") as! DetailsOfItemsViewController
                vc.modalPresentationStyle = .fullScreen
                navigationController?.pushViewController(vc, animated: true)
                
            }
            
            
            
            
            
        } else {
        }
       
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if #available(iOS 13.0, *) {
            if collectionView.tag == 1{
                 if let cell = collectionView.cellForItem(at: indexPath) as? MenuCollectionViewCell {
                cell.lineView.backgroundColor = .clear
                }
            }else {
                
            }
            
            
            
            
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if self.itemOfCatogoryCollectionView.isDragging{
            cell.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
    
    
    
    
    
    
}


//MARK:-UICollectionViewDelegateFlowLayout

extension CatagogryViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        
        if collectionView.tag == 1{
          
        }else {
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
        let cellSize = CGSize(width: collectionView.bounds.width , height:  60)
        
        return cellSize
    }
}
