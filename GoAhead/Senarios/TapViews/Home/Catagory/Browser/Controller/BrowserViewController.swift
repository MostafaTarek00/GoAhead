//
//  BrowserViewController.swift
//  GoAhead
//
//  Created by Mustafa on 1/21/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit
@available(iOS 13.0, *)
class BrowserViewController: UIViewController {
    var url : String?
    @IBOutlet weak var webViewBrowser: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getWebSite(link: url!)


        // Do any additional setup after loading the view.
    }
    

   func getWebSite(link : String) {
          
          let url = URL(string: link)
          webViewBrowser.loadRequest(URLRequest(url: url!))
          
      }

    @IBAction func backBtbPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)

    }
    
}
