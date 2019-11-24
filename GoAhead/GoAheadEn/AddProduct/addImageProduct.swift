//
//  addImageProduct.swift
//  GoAhead
//
//  Created by Maged on 2/13/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit
import MIBlurPopup

class addImageProduct: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate, ErrorFeedBack
{
    
    var imagePicker:UIImagePickerController!
    var cateId:String?
    weak var imageToSened:UIImage?
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var cancelBu: UIButton!
    @IBOutlet weak var NextBu: UIButton!
    @IBOutlet weak var background: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        print(cateId!)
        design()
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage
        {
            productImage.image = image
            self.imageToSened = image
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addImage(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func nextBu(_ sender: Any) {
        guard let image = self.imageToSened else{
        self.showErrorAlert(title: "Error", msg: "Please Select Image ")
            return}
        self.performSegue(withIdentifier: "addMultiImage", sender: self.imageToSened)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addMultiImage"{
            if let destantion  = segue.destination as? multiImage
            {
                if let image = sender as? UIImage{
                    destantion.cateId = self.cateId
                    destantion.mainImage = image
                    
                }
            }
        }
    }
    
    @IBAction func cencelAddBu(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
}

extension addImageProduct: MIBlurPopupDelegate {
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
