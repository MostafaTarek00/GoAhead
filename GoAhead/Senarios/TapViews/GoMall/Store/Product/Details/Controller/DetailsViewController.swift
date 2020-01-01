//
//  DetailsViewController.swift
//  GoAhead
//
//  Created by Mustafa on 1/1/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit
import Auk

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var imageSlider: UIScrollView!
    
  
    @IBOutlet weak var detailsTableView: UITableView!{
        didSet{
            detailsTableView.rowHeight = UITableView.automaticDimension
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
     imageSlider.auk.settings.contentMode = .scaleAspectFill
        imageSlider.auk.settings.pageControl.currentPageIndicatorTintColor = UIColor.yellow
        if let image = UIImage(named: "30") {
            imageSlider.auk.show(image: image)
        }
        if let image = UIImage(named: "40") {
            imageSlider.auk.show(image: image)
        }
        if let image = UIImage(named: "50") {
            imageSlider.auk.show(image: image)
        }
    }
}


extension DetailsViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell" , for: indexPath) as! DetailsTableViewCell
        
        return cell
    }
    
    
}
