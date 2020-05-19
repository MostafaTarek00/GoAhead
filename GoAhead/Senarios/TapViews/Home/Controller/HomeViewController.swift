//
//  HomeTableViewController.swift
//  GoAhead
//
//  Created by Mustafa on 11/21/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit
import SDWebImage
import NVActivityIndicatorView
class HomeViewController: UIViewController ,NVActivityIndicatorViewable{
    var cat:Categories?
    @IBOutlet weak var departmentCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        showNavigation()
        getAllCategories()
        
    }
    
    
    func getAllCategories(){
        self.startAnimating()
        APIClient.getAllCategories() { (Result) in
            switch Result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.stopAnimating()
                    self.cat = response
                    self.departmentCollectionView.reloadData()
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

extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  cat?.categories.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryHomeCollectionViewCell", for: indexPath) as! CategoryHomeCollectionViewCell
         cell.categoryHomeImage.sd_setImage(with: URL(string: cat?.categories[indexPath.item].image ?? ""), placeholderImage: UIImage(named: "logo GoAhead"))
        cell.categoryHomeName.text = cat?.categories[indexPath.item].name
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
            let vc = storyboard?.instantiateViewController(withIdentifier: "CatagogryViewController") as! CatagogryViewController
            vc.modalPresentationStyle = .fullScreen
                   vc.catId = cat?.categories[indexPath.item].id
                   vc.index = indexPath
                   vc.title = cat?.categories[indexPath.item].name
                   navigationController?.pushViewController(vc, animated: true)
       
       
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if self.departmentCollectionView.isDragging{
            cell.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
    
    
}

extension HomeViewController : UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let cellSize = CGSize(width: self.view.frame.width/1-10 , height: 180)
        return cellSize
    }
    
    
    
    
    
}



