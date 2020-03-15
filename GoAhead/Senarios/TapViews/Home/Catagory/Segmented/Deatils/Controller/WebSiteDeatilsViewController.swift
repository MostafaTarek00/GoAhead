//
//  WebSiteDeatilsViewController.swift
//  GoAhead
//
//  Created by Mustafa on 2/17/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class WebSiteDeatilsViewController: UIViewController ,NVActivityIndicatorViewable {
    
    @IBOutlet weak var webSiteImage: UIImageView!{
        didSet{
            webSiteImage.layer.cornerRadius = 20
        }
    }
    
    @IBOutlet weak var itemFav: UIImageView!
    
    @IBOutlet weak var onthorWebsiteCollextionView: UICollectionView!
    
    @IBOutlet weak var webSiteDes: UILabel!
    var offersOfCat:OffersOfCategory?
    var failure:Failure?

    let textArray = ["dice1".localized,"dice2".localized,"dice3".localized,"dice4".localized,"dice5".localized,"dice6".localized]
    var randomDiceIndex1 : Int = 0
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAndBacNavigation()
        updateDesign()
        getViewCategoryWebsites(categoryID: SegmentedViewController.catId!, userId: UserDefault.getId())
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        showAndBacNavigation()
        
        
    }
    
    func getViewCategoryWebsites(categoryID : String, userId : String ){
        self.startAnimating()
        APIClient.viewCategoryWebsites(categoryID: categoryID, userId: userId)
        { (Result) in
            switch Result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.stopAnimating()
                    self.offersOfCat = response
                    self.onthorWebsiteCollextionView.reloadData()
                    print(response)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.stopAnimating()
                    print(error.localizedDescription)
                    APIClient.viewCategoryWebsitesfailure(categoryID: categoryID, userId: userId)
                    { (Result) in
                        switch Result {
                        case .success(let response):
                            DispatchQueue.main.async {
                                self.stopAnimating()
                                self.failure = response
                                self.onthorWebsiteCollextionView.reloadData()
                                Alert.show(NSLocalizedString("Error", comment: ""), massege: self.failure!.message, context: self)
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
        }
        
    }
    
    func updateDesign()  {
        webSiteImage.sd_setImage(with: URL(string: SegmentedViewController.imageLink ?? ""), placeholderImage: UIImage(named: "logo GoAhead"))
        self.title  = SegmentedViewController.nameText
        if SegmentedViewController.favorite == 0 {
            itemFav.image = UIImage(named: "favorite2")
        }else if SegmentedViewController.favorite == 1 {
            itemFav.image = UIImage(named: "favorite1")
        }
        randomDiceIndex1 = Int.random(in: 0 ... 5)
        webSiteDes.text = textArray[randomDiceIndex1]
        
        
    }
    
    
    
    
    @IBAction func goToWebSiteBtnPressed(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "BrowserViewController") as? BrowserViewController {
            vc.url = SegmentedViewController.url
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
    
    
    
}



extension WebSiteDeatilsViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  offersOfCat?.offers.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WebSiteDeatilsCollectionViewCell", for: indexPath) as! WebSiteDeatilsCollectionViewCell
        cell.imageCell.sd_setImage(with: URL(string: offersOfCat?.offers[indexPath.item].image ?? ""), placeholderImage: UIImage(named: "logo GoAhead"))
        return cell
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        webSiteImage.sd_setImage(with: URL(string: offersOfCat?.offers[indexPath.item].image ?? ""), placeholderImage: UIImage(named: "logo GoAhead"))
        SegmentedViewController.url = offersOfCat?.offers[indexPath.item].link
        SegmentedViewController.favorite = offersOfCat?.offers[indexPath.item].favorite
        if SegmentedViewController.favorite == 0 {
            itemFav.image = UIImage(named: "favorite2")
        }else if SegmentedViewController.favorite == 1 {
            itemFav.image = UIImage(named: "favorite1")
        }
        self.title  = offersOfCat?.offers[indexPath.item].name
        randomDiceIndex1 = Int.random(in: 0 ... 5)
        webSiteDes.text = textArray[randomDiceIndex1]
    }
    
    
}


extension WebSiteDeatilsViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let cellSize = CGSize( width: self.view.frame.width / 2 - 15 , height:  120)
        
        return cellSize
    }
}


