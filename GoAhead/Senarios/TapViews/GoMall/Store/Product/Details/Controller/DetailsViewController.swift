//
//  DetailsViewController.swift
//  GoAhead
//
//  Created by Mustafa on 1/1/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit
import Auk
import NVActivityIndicatorView

@available(iOS 13.0, *)
class DetailsViewController: UIViewController , NVActivityIndicatorViewable {
    var ProId : String?
    var productDetails:ProductDetails?
    var failure:Failure?
    var flagBtn : Bool?
    @IBOutlet weak var imageSlider: UIScrollView!
    @IBOutlet weak var detailsTableView: UITableView!{
        didSet{
            detailsTableView.rowHeight = UITableView.automaticDimension
        }
    }
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var addToCartBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAndBacNavigation()
        getDetailsOfProduct()
        
    }
    
    
    
    func getDetailsOfProduct(){
        self.startAnimating()
        if let ProId = ProId {
            APIClient.getProductDetails(productID: ProId){ (Result) in
                switch Result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self.stopAnimating()
                        self.productDetails = response
                        self.detailsTableView.reloadData()
                        self.updateDate() 
                        print(response)
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.stopAnimating()
                        print(error.localizedDescription)
                        APIClient.getProductDetailsFailure(productID: ProId){ (Result) in
                            switch Result {
                            case .success(let response):
                                DispatchQueue.main.async {
                                    self.stopAnimating()
                                    self.failure = response
                                    Alert.show("خطاء", massege: self.failure!.message, context: self)
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
    }
    
    
    
    func updateDate()  {
        productTitle.text = productDetails?.product.name
        imageSlider.auk.settings.contentMode = .scaleAspectFill
        imageSlider.auk.settings.pageControl.currentPageIndicatorTintColor = UIColor.init(named: "Background")
        let  number : Int = (productDetails?.productImages.count)!
        print(number)
        for i in 0..<number{
            print(i)
            if let image = productDetails?.productImages[i] {
                imageSlider.auk.show(url: image)
            }
        }
        if flagBtn == true {
            addToCartBtn.isHidden = true
        }else {
            addToCartBtn.isHidden = false
            
        }
        
    }
    
    @IBAction func addToCartBtnPressed(_ sender: UIButton) {
    }
}


@available(iOS 13.0, *)
extension DetailsViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell" , for: indexPath) as! DetailsTableViewCell
        cell.proName.text = productDetails?.product.name
        cell.proPrice.text = productDetails?.product.price
        cell.proDis.text = productDetails?.product.productDescription
        return cell
    }
    
    
}
