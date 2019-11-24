//
//  APIClient.swift
//  Networking
//
//  Created by Alaeddine Messaoudi on 14/12/2017.
//  Copyright © 2017 Alaeddine Me. All rights reserved.
//
import Alamofire
import SwiftyJSON
class APIClient {
   
   @discardableResult
   private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T,AFError>)->Void) -> DataRequest {
       return AF.request(route)
                      .responseDecodable (decoder: decoder){
                           (response: DataResponse<T,AFError>) in
                           completion(response.result)
       }
   }
    
   @discardableResult
   private static func performRequestSimple(route:APIRouter, completion: @escaping (Result<String, AFError>)->Void) -> DataRequest {
       return AF.request(route)
           .responseString(encoding: String.Encoding.utf8) {
               (response) in
               completion(response.result)
       }
   }
    
    
    
    //---------------------------------------------------
    
    static func getAllCategories(completion:@escaping
        (Result<GetCategories,AFError>)->Void){
        performRequest(route: APIRouter.getAllCategories , completion: completion)
    }
    
    
    static func login(mail : String , password : String , completion:@escaping
        (Result<User,AFError>)->Void){
        performRequest(route: APIRouter.login(mail: mail, password: password), completion: completion)
    }
    
    static func loginError(mail : String , password : String , completion:@escaping
        (Result<Failure,AFError>)->Void){
        performRequest(route: APIRouter.login(mail: mail, password: password), completion: completion)
    }
    
    static func getUserFavouriteOffers(UserID : String , completion:@escaping
        (Result<String,AFError>)->Void){
        performRequestSimple(route: APIRouter.getUserFavoriteOffers(userID: UserID), completion: completion)
    }
    
    static func getAllProductCategories(completion:@escaping
        (Result<String,AFError>)->Void){
        performRequestSimple(route: APIRouter.getAllProductCategories , completion: completion)
    }
    
    static func viewProductDetails(productID : String , completion:@escaping
        (Result<String,AFError>)->Void){
        performRequestSimple(route: APIRouter.viewProductDetails(productID: productID), completion: completion)
    }
    
    static func viewUserProducts(UserID : String , completion:@escaping
        (Result<String,AFError>)->Void){
        performRequestSimple(route: APIRouter.viewUserProducts(userID: UserID), completion: completion)
    }
    
    static func viewSellerDetails(sellerID : String , completion:@escaping
        (Result<String,AFError>)->Void){
        performRequestSimple(route: APIRouter.viewSellerDetails(sellerID: sellerID), completion: completion)
    }
    
    static func viewSellersByCategoryID(categoryID : String , completion:@escaping
        (Result<String,AFError>)->Void){
        performRequestSimple(route: APIRouter.ViewSellersByCategoryId(categoryID: categoryID), completion: completion)
    }
    
    static func viewSellerProductByCategoryIdAndSellerId(categoryID: String ,sellerID: String, completion:@escaping
        (Result<String,AFError>)->Void){
        performRequestSimple(route: APIRouter.viewSellersProductsByCategoryIdAndSellerId(categoryID: categoryID, sellerID: sellerID), completion: completion)
    }
    
    static func getUserDetailsById(UserID : String , completion:@escaping
        (Result<String,AFError>)->Void){
        performRequestSimple(route: APIRouter.getUserDetalisById(userID: UserID), completion: completion)
    }
    

}


