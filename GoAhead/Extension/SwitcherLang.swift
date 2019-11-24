//
//  SwitcherLang.swift
//  GoAhead
//
//  Created by Maged on 5/27/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import Foundation
import UIKit

class SwitcherLang {
    
    static func updateRootVC(){
        
        let langStatus = UserDefaults.standard.bool(forKey: "lang")
        var rootVC : UIViewController?
        
        print(langStatus)
        
        if(langStatus == true){
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CateVCAr") as! UINavigationController
        }else{
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CateVC") as! UINavigationController
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = rootVC
        
    }
    
}
