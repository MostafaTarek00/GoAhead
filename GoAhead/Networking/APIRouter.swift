//
//  APIRouter.swift
//  Networking
//
//  Created by Alaeddine Messaoudi on 26/11/2017.
//  Copyright © 2017 Alaeddine Me. All rights reserved.
//

import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case getAllCategories
    case viewCategoryWebsites(categoryID:String)
    case login(mail:String , password : String)
    case register
    case addOfferToFavorite(userID:String ,OfferID:String)
    case deleteOfferFromFavorites(userID:String ,OfferID:String)
    case getUserFavoriteOffers(userID:String)
    case getOffers
    case getAllProductCategories
    case viewProductCategoryProducts(categoryID:String)
    case viewProductDetails(productID:String)
    case viewUserProducts(userID:String)
    case viewSellerDetails(sellerID:String)
    case addProduct(userID:String ,categoryID:String ,title:String ,description:String ,price:String)
    case ViewSellersByCategoryId(categoryID:String)
    case viewSellersProductsByCategoryIdAndSellerId(categoryID:String ,sellerID:String)
    case getUserDetalisById(userID:String)
    case deleteProduct(productID:String ,userID:String)
    case searchForCategory(search:String ,pageNumber:String)
    case searchForProduct(search:String ,pageNumber:String)
    case searchForSeller(search:String ,pageNumber:String)
    case sendOrder(userID:String ,sellerID:String)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .login:
            return .get
        case .getAllCategories:
            return .get
        case .viewCategoryWebsites:
            return .get
        case .addOfferToFavorite:
            return .get
        case .register:
            return .get
        case .deleteOfferFromFavorites:
            return .get
        case .getUserFavoriteOffers:
            return .get
        case .getOffers:
            return .get
        case .getAllProductCategories:
            return .get
        case .viewProductCategoryProducts:
            return .get
        case .viewProductDetails:
            return .get
        case .viewUserProducts:
            return .get
        case .viewSellerDetails:
            return .get
        case .addProduct:
            return .get
        case .ViewSellersByCategoryId:
            return .get
        case .viewSellersProductsByCategoryIdAndSellerId:
            return .get
        case .getUserDetalisById:
            return .get
        case .deleteProduct:
            return .get
        case .searchForCategory:
            return .get
        case .searchForProduct:
            return .get
        case .searchForSeller:
            return .get
        case .sendOrder:
            return .get
        }
    }

    // MARK: - Path
    private var path: String {
        switch self {
        case .login(let mail, let password):
            return "/\(K.ProductionServer.userType)/login/\(K.ProductionServer.webserviceUser)/\(K.ProductionServer.webservicePass)/\(mail)/\(password)"
        case .getAllCategories:
            return "/\(K.ProductionServer.categotyType)/getAll/\(K.ProductionServer.webserviceUser)/\(K.ProductionServer.webservicePass)"
        case .viewCategoryWebsites:
            return "/\(K.ProductionServer.categotyType)/getAll/\(K.ProductionServer.webserviceUser)/\(K.ProductionServer.webservicePass)"
        case .register:
            return "/\(K.ProductionServer.userType)/register/\(K.ProductionServer.webserviceUser)/\(K.ProductionServer.webservicePass)/"
        case .addOfferToFavorite(let userID, let OfferID):
            return "/\(K.ProductionServer.userType)/addFavoriteOffer/\(K.ProductionServer.webserviceUser)/\(K.ProductionServer.webservicePass)/\(userID)/\(OfferID)"
        case .deleteOfferFromFavorites(let userID, let OfferID):
            return "/\(K.ProductionServer.userType)/deleteFavoriteOffer/\(K.ProductionServer.webserviceUser)/\(K.ProductionServer.webservicePass)/\(userID)/\(OfferID)"
        case .getUserFavoriteOffers(let userID):
            return "/\(K.ProductionServer.userType)/getFavoriteOffers/\(K.ProductionServer.webserviceUser)/\(K.ProductionServer.webservicePass)/\(userID)"
        case .getOffers:
            return "/\(K.ProductionServer.categotyType)/viewSpecialOffers/\(K.ProductionServer.webserviceUser)/\(K.ProductionServer.webservicePass)/"
        case .getAllProductCategories:
            return "/\(K.ProductionServer.productCategotyType)/getAll/\(K.ProductionServer.webserviceUser)/\(K.ProductionServer.webservicePass)/"
        case .viewProductCategoryProducts(let categoryID):
            return "/\(K.ProductionServer.productCategotyType)/view/\(K.ProductionServer.webserviceUser)/\(K.ProductionServer.webservicePass)/\(categoryID)"
        case .viewProductDetails(let productID):
            return "/\(K.ProductionServer.productType)/view/\(K.ProductionServer.webserviceUser)/\(K.ProductionServer.webservicePass)/\(productID)"
        case .viewUserProducts(let userID):
            return "/\(K.ProductionServer.userType)/view_user_products/\(K.ProductionServer.webserviceUser)/\(K.ProductionServer.webservicePass)/\(userID)"
        case .viewSellerDetails(let sellerID):
            return "/\(K.ProductionServer.productType)/view_seller/\(K.ProductionServer.webserviceUser)/\(K.ProductionServer.webservicePass)/\(sellerID)"
        case .addProduct(let userID, let categoryID, let title, let description, let price):
            return "/\(K.ProductionServer.productType)/add/\(K.ProductionServer.webserviceUser)/\(K.ProductionServer.webservicePass)/\(userID)/\(categoryID)/\(title)/\(description)/\(price)"
        case .ViewSellersByCategoryId(let categoryID):
            return "/\(K.ProductionServer.productCategotyType)/getAllSellersByCategoryId/\(K.ProductionServer.webserviceUser)/\(K.ProductionServer.webservicePass)/\(categoryID)"
        case .viewSellersProductsByCategoryIdAndSellerId(let categoryID, let sellerID):
            return "/\(K.ProductionServer.productCategotyType)/getAllProductsByCategoryAndSeller/\(K.ProductionServer.webserviceUser)/\(K.ProductionServer.webservicePass)/\(categoryID)/\(sellerID)"
        case .getUserDetalisById(let userID):
            return "/user/userProfile/\(K.ProductionServer.webserviceUser)/\(K.ProductionServer.webservicePass)/\(userID)"
        case .deleteProduct(let productID, let userID):
            return "/\(K.ProductionServer.productCategotyType)/deleteProduct/\(K.ProductionServer.webserviceUser)/\(K.ProductionServer.webservicePass)/\(productID)/\(userID)"
        case .searchForCategory(let search, let pageNumber):
            return "/\(K.ProductionServer.productCategotyType)/search/\(K.ProductionServer.webserviceUser)/\(K.ProductionServer.webservicePass)/\(search)/\(pageNumber)"
        case .searchForProduct(let search, let pageNumber):
            return "/\(K.ProductionServer.productType)/search/\(K.ProductionServer.webserviceUser)/\(K.ProductionServer.webservicePass)/\(search)/\(pageNumber)"
        case .searchForSeller(let search, let pageNumber):
            return "/user/search/\(K.ProductionServer.webserviceUser)/\(K.ProductionServer.webservicePass)/\(search)/\(pageNumber)"
        case .sendOrder(let userID, let sellerID):
            return "/\(K.ProductionServer.cartType)/sendOrder/\(K.ProductionServer.webserviceUser)/\(K.ProductionServer.webservicePass)/\(userID)/\(sellerID)"
        }
    }
    private var parameters: Parameters? {
        switch self {
        
     
        case .getAllCategories:
            return nil
        case .viewCategoryWebsites(_):
            return nil
        case .login(_):
            return nil
        case .register:
            return nil
        case .addOfferToFavorite(_):
            return nil
        case .deleteOfferFromFavorites(_):
            return nil
        case .getUserFavoriteOffers(_):
            return nil
        case .getOffers:
            return nil
        case .getAllProductCategories:
            return nil
        case .viewProductCategoryProducts(_):
            return nil
        case .viewProductDetails(_):
            return nil
        case .viewUserProducts(_):
            return nil
        case .viewSellerDetails(_):
            return nil
        case .addProduct(_):
            return nil
        case .ViewSellersByCategoryId(_):
            return nil
        case .viewSellersProductsByCategoryIdAndSellerId(_):
            return nil
        case .getUserDetalisById(_):
            return nil
        case .deleteProduct(_):
            return nil
        case .searchForCategory(_):
            return nil
        case .searchForProduct(_):
            return nil
        case .searchForSeller(_):
            return nil
        case .sendOrder(_):
            return nil
        }
        
}
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try K.ProductionServer.baseURL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData

        print("*****************\(urlRequest)")
        // Parameters
        if let parameters = parameters {
            do {
                
                urlRequest = try URLEncoding.httpBody.encode(urlRequest, with: parameters)
               
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
}

