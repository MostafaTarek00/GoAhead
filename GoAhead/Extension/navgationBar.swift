//
//  navgationBar.swift
//  GoAhead
//
//  Created by Maged on 3/4/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setColorOfNav(){
        let navbarFont = UIFont(name: "Ubuntu", size: 17) ?? UIFont.systemFont(ofSize: 17)
        
        navigationController?.navigationBar.barTintColor = UIColor(named: "Background")
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: navbarFont, NSAttributedString.Key.foregroundColor:UIColor.white]
    }
    
    
}
