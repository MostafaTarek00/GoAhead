//
//  multiImage.swift
//  GoAhead
//
//  Created by Maged on 2/14/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit
import YPImagePicker
import MIBlurPopup



class multiImage: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBOutlet weak var ImageCollection: UICollectionView!
    var mainImage:UIImage?
    var cateId:String?
    var imageToSend = [UIImage]()
    var customBlurEffectStyle: UIBlurEffect.Style!

    @IBOutlet weak var cancelBu: UIButton!
    @IBOutlet weak var NextBu: UIButton!
    @IBOutlet weak var background: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setColorOfNav()
        design()
        print(cateId)
    }
    
    func addImage(){
        var config = YPImagePickerConfiguration()
        config.library.maxNumberOfItems = 5
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { [unowned picker] items, cancelled in
            for item in items {
                switch item {
                case .photo(let photo):
                    self.imageToSend.append(photo.originalImage)
                    self.ImageCollection.reloadData()
                    print(photo)
                case .video(let video):
                    print(video)
                }
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
        
    }
    
    func design(){
        customBlurEffectStyle = .dark
        self.background.layer.cornerRadius = 10
        self.background.layer.masksToBounds = true

        self.cancelBu.layer.cornerRadius = 20
        self.cancelBu.layer.borderWidth = 1
        self.cancelBu.layer.borderColor = UIColor(named: "Background")?.cgColor
        self.NextBu.layer.cornerRadius = 20
    }
    
    @IBAction func addImage(_ sender: Any) {
            addImage()
    }
    
    @IBAction func nextBu(_ sender: Any) {
        if self.imageToSend.count > 0{
            
            performSegue(withIdentifier: "addInformation", sender: self.imageToSend)
            
//            let image = UIImage(named: "photo")
//            netWorking.addProductWithMultiImage(Image: image!,album: imageToSend, cateId: "1", title: "MagedMohammed", description: "NewProductNewProduct", price: "9090") { _ in}
    }
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addInformation"{
            if let destantion  = segue.destination as? addProudcteInformation
            {
                if let image = sender as? [UIImage]{
                    destantion.cateId = self.cateId
                    destantion.mainImage = self.mainImage
                    destantion.imageArr = image
                    
                }
            }
        }
    }
    @IBAction func cencelAddBu(_ sender: UIButton) {
        dismiss(animated: true)
        
    }
    
    
}
extension multiImage: MIBlurPopupDelegate {
    var popupView: UIView {
        return background
    }
    
    var blurEffectStyle: UIBlurEffect.Style {
        return customBlurEffectStyle
    }
    
    var initialScaleAmmount: CGFloat {
        return CGFloat(Double(0.1))
    }
    
    var animationDuration: TimeInterval {
        return TimeInterval(0.5)
    }
    
    
    
}

