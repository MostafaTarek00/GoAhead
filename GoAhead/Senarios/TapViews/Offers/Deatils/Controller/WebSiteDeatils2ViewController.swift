//
//  WebSiteDeatils2ViewController.swift
//  GoAhead
//
//  Created by Mustafa on 2/19/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit

class WebSiteDeatils2ViewController: UIViewController {
    
    @IBOutlet weak var webSiteImage: UIImageView!{
          didSet{
              webSiteImage.layer.cornerRadius = 20
          }
      }
      
      @IBOutlet weak var itemFav: UIImageView!
    
    var url : String?
    var imageLink : String?
    var favorite : Int?
    var nameText : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        showAndBacNavigation()
               updateDesign()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        showAndBacNavigation()

        
    }
    //WebSiteDeatils2
    func updateDesign()  {
        webSiteImage.sd_setImage(with: URL(string: imageLink ?? ""), placeholderImage: UIImage(named: "logo GoAhead"))
        self.title  = nameText
        if favorite == 0 {
            itemFav.image = UIImage(named: "favorite2")
        }else if favorite == 1 {
            itemFav.image = UIImage(named: "favorite1")
        }
    }

   
   @IBAction func goToWebSiteBtnPressed(_ sender: UIButton) {
       if let vc = storyboard?.instantiateViewController(withIdentifier: "BrowserViewController") as? BrowserViewController {
           vc.url = url
           vc.modalPresentationStyle = .fullScreen
           present(vc, animated: true, completion: nil)
       }
   }

}
