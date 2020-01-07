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
    
    static func login(mail : String , password : String , completion:@escaping
        (Result<Login,AFError>)->Void){
        performRequest(route: APIRouter.login(mail: mail, password: password), completion: completion)
        
    }
    
    static func loginfailure(mail : String , password : String , completion:@escaping
        (Result<Failure,AFError>)->Void){
        performRequest(route: APIRouter.login(mail: mail, password: password), completion: completion)
        
    }
    
    static func getAllCategories( completion:@escaping
           (Result<Categories,AFError>)->Void){
        performRequest(route: APIRouter.getAllCategories, completion: completion)
           
       }
    
    static func viewCategoryWebsites(categoryID : String , userId : String , completion:@escaping
           (Result<OffersOfCategory,AFError>)->Void){
        performRequest(route: APIRouter.viewCategoryWebsites(categoryID: categoryID, userId: userId), completion: completion)
       }
    
    
    
    
}


