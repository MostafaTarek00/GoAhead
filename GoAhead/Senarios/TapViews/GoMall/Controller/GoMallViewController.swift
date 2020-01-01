//
//  GoMallViewController.swift
//  GoAhead
//
//  Created by Mustafa on 11/21/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class GoMallViewController: UIViewController {
    var imageTest = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20",
"21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40",
"41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60",
"61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80",
"81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100"]
    
    @IBOutlet weak var goMallCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  
    
    
    
    
    @IBAction func searchBtnPressed(_ sender: UIBarButtonItem) {
    }
    @IBAction func cartBtnPressed(_ sender: UIBarButtonItem) {
    }
    @IBAction func menuBtnPressed(_ sender: UIBarButtonItem) {
        let sMenu = storyboard?.instantiateViewController(identifier: "SideMenuNavigationController")
        sMenu?.modalPresentationStyle = .fullScreen
        present(sMenu!, animated: true, completion: nil)
    }
}


@available(iOS 13.0, *)
extension GoMallViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GoMallCollectionViewCell", for: indexPath) as! GoMallCollectionViewCell
        cell.goMallImage.image = UIImage(named: imageTest[indexPath.item])

        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           
           let vc = storyboard?.instantiateViewController(identifier: "StoresOfMallViewController") as! StoresOfMallViewController
           vc.modalPresentationStyle = .fullScreen
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











