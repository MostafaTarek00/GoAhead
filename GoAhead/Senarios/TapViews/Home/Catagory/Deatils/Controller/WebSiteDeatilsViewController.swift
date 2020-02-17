//
//  WebSiteDeatilsViewController.swift
//  GoAhead
//
//  Created by Mustafa on 2/17/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit

class WebSiteDeatilsViewController: UIViewController {
    
    @IBOutlet weak var webSiteImage: UIImageView!
    @IBOutlet weak var websiteName: UILabel!
    var url : String?
    var imageLink : String?
    var nameText : String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAndBacNavigation()
        updateDesign()
        // Do any additional setup after loading the view.
    }
    
    func updateDesign()  {
        webSiteImage.sd_setImage(with: URL(string: imageLink ?? ""), placeholderImage: UIImage(named: "logo GoAhead"))
        websiteName.text = nameText
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        showAndBacNavigation()
        
    }

   
    @IBAction func goToWebSiteBtnPressed(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "BrowserViewController") as? BrowserViewController {
            vc.url = url
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
    
}
