//
//  DetailsOfItemsViewController.swift
//  GoAhead
//
//  Created by Mustafa on 11/24/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit

class DetailsOfItemsViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var lineView1: UIView!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var lineView2: UIView!
    @IBOutlet weak var someOfItemCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}

extension DetailsOfItemsViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemShowCollectionViewCell", for: indexPath) as! ItemShowCollectionViewCell
        
        return cell
        
    }
    
    
}
