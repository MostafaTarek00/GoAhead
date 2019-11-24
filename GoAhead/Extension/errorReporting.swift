//
//  errorReporting.swift
//  WeatherApp
//
//  Created by Magid on 10/10/18.
//  Copyright © 2018 Magid. All rights reserved.
//

import Foundation
import UIKit


protocol ErrorFeedBack {
}

extension ErrorFeedBack where Self:UIViewController
{
    func showErrorAlert(title: String, msg: String)
    {
        let VC = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        VC.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in self.dismiss(animated: true, completion: nil)}))
        
        present(VC, animated: true)
    }
    
}
