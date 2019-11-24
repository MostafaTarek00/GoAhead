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

    @IBOutlet weak var goMallCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GoMallCollectionViewCell", for: indexPath) as! GoMallCollectionViewCell
                      
                      return cell
        
    }
    

    

}












