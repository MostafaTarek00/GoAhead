//
//  ItemsViewController.swift
//  GoAhead
//
//  Created by Mustafa on 11/24/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController {

    @IBOutlet weak var items3CollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    

}


extension ItemsViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemsCollectionViewCell", for: indexPath) as! ItemsCollectionViewCell
             
             return cell
    }
    
    
    
}

