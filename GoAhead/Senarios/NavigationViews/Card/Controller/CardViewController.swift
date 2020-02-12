//
//  CardViewController.swift
//  GoAhead
//
//  Created by Mustafa on 1/2/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit
import CoreData
import NVActivityIndicatorView
import Alamofire
import SwiftyJSON

class CardViewController: UIViewController ,NVActivityIndicatorViewable {
    var count : Int = 1
    var price : String?
    var totalPrice : Double = 1
    var orders:Orders?
    let basedUrl = "http://www.goaheadho.com/goahead_en/cart/sendOrder/82984218/951735"
    var data = [[String]]()
    
    
    @IBOutlet weak var CardCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        showAndBacNavigation()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        showAndBacNavigation()
        loadItems()
    }
    
    
    func sendOrdes(url : String , parameters :[String :String])  {
        self.startAnimating()
        AF.request(url, method:.post, parameters: parameters).responseJSON {
            response  in
            switch response.result {
            case .success(let value):
                DispatchQueue.main.async {
                    self.stopAnimating()
                    if let JSON = value as? [String: Any] {
                        print(JSON)
                        let status = JSON["status"] as! Int
                        let msg = JSON["message"] as! String
                        if status == 1 {
                            self.orders?.status = JSON["status"] as! Int
                            self.orders?.message = JSON ["message"] as! String
                            self.orders?.id_order = JSON ["id_order"] as! String
                            Alert.show(NSLocalizedString("Success", comment: ""), massege: msg, context: self)
                            
                        }else if status == 2 {
                            self.orders?.status = JSON["status"] as! Int
                            self.orders?.message = JSON ["message"] as! String
                            Alert.show(NSLocalizedString("Error", comment: ""), massege: msg, context: self)
                        }
                        print(status)
                    }
                }
            case .failure(let error):
                self.stopAnimating()
                print(error.localizedDescription)
            }
        }
    }
    
    func completeUrl() -> String {
        let userId = UserDefault.getId()
        let sellerId = UserDefault.getCheckSeller()
        let finalUrl = "\(basedUrl)/\(userId)/\(sellerId)"
        print(finalUrl)
        return finalUrl        
    }
    
    
    @IBAction func proceedBtnPressed(_ sender: UIButton) {
        let parameters = ["products": "\(data)"]
        for i in Shared.cartArray {
            data.append([i.productId!,i.productCount!,i.productPrice!] )
        }
        print(data)
        sendOrdes(url: completeUrl(), parameters: parameters)
            if let vc = storyboard?.instantiateViewController(withIdentifier: "SellerViewController") as? SellerViewController {
                vc.modalPresentationStyle = .fullScreen
                vc.sellerId = UserDefault.getCheckSeller()
                deleteAll()
                Shared.cartArray.removeAll()
                UserDefault.setCheckSeller("")
                deleteInCart()
                
                navigationController?.pushViewController(vc, animated: true)
                
            }
       
    }
    
    func deleteAll()  {
        let request : NSFetchRequest<Cart> = Cart.fetchRequest()
        request.includesPropertyValues = false
        do {
            let items = try Shared.context.fetch(request as! NSFetchRequest<NSFetchRequestResult>) as! [NSManagedObject]
            
            for item in items {
                Shared.context.delete(item)
            }
            try Shared.context.save()
            
        } catch {
            print("Error Delete Data From Context\(error)")
        }
    }
    func loadItems() {
        do{
            let request : NSFetchRequest<Cart> = Cart.fetchRequest()
            Shared.cartArray = try Shared.context.fetch(request)
            
        }catch{
            print("Error Fetching Data From Context\(error)")
            
        }
    }
    
    func saveInCart()  {
        do {
            try Shared.context.save()
        }catch {
            print("Error Saving  Context \(error)")
            
        }
    }
    
    func deleteInCart()  {
        do {
            try Shared.context.save()
        }catch {
            print("Error Saving  Context \(error)")
            
        }
        showAndBacNavigation()
        CardCollectionView.reloadData()
    }
    
}

extension CardViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  Shared.cartArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as! CardCollectionViewCell
        cell.productImage.sd_setImage(with: URL(string: Shared.cartArray[indexPath.item].productImg ?? ""), placeholderImage: UIImage(named: "logo GoAhead"))
        cell.productTitle.text = Shared.cartArray[indexPath.item].productName
        cell.productDes.text = Shared.cartArray[indexPath.item].productDes
        cell.productPrice.text = Shared.cartArray[indexPath.item].productPrice
        cell.countLbl.text = Shared.cartArray[indexPath.item].productCount
        cell.price = Shared.cartArray[indexPath.item].productPrice
        cell.index = indexPath
        cell.delegate = self
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
            vc.modalPresentationStyle = .fullScreen
                   vc.ProId = Shared.cartArray[indexPath.item].productId
                   vc.flagBtn = true
                   navigationController?.pushViewController(vc, animated: true)
       
       
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if self.CardCollectionView.isDragging{
            cell.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
    
}

extension CardViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let cellSize = CGSize(width: self.view.frame.width/1-20 , height: 250)
        return cellSize
    }
}


extension CardViewController : UpdateCart {
    func delete(index: Int) {
        Shared.context.delete(Shared.cartArray[index])
        Shared.cartArray.remove(at: index)
        deleteInCart()
    }
    
    func update(countText: String, index: Int) {
        Shared.cartArray[index].productCount =  countText
        saveInCart()
        
    }
   
}
