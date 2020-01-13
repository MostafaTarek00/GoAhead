//
//  Constants.swift
//  Networking
//
//  Created by Alaeddine Messaoudi on 26/11/2017.
//  Copyright © 2017 Alaeddine Me. All rights reserved.
//

import Foundation

struct K {
    struct ProductionServer {
        
        static let baseURLEn = "http://www.goaheadho.com/goahead_en"
        static let baseURLAr = "http://www.goaheadho.com/goahead_ar"
        static let webserviceUser = "82984218"
        static let webservicePass = "951735"
        static let userType = "User"
        static let categotyType = "Category"
        static let productCategotyType = "Product_category"
        static let productType = "Product"
        static let cartType = "User"


    }
    
    //register
    struct register {
          static let image = "image"
      }
    
    
    
    
    
    
    
}



enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
