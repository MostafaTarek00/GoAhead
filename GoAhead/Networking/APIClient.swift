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
    
    static func viewCategoryWebsitesfailure(categoryID : String , userId : String , completion:@escaping
        (Result<Failure,AFError>)->Void){
        performRequest(route: APIRouter.viewCategoryWebsites(categoryID: categoryID, userId: userId), completion: completion)
    }
    
    static func addOfferToFavorite( userId : String ,OfferID:String, completion:@escaping
        (Result<AddAndDeleteFavoriteOffers,AFError>)->Void){
        performRequest(route: APIRouter.addOfferToFavorite(userID: userId, OfferID: OfferID), completion: completion)
    }
    
    static func deleteOfferFromFavorites( userId : String ,OfferID:String, completion:@escaping
        (Result<AddAndDeleteFavoriteOffers,AFError>)->Void){
        performRequest(route: APIRouter.deleteOfferFromFavorites(userID: userId, OfferID: OfferID), completion: completion)
    }
    
    static func getMostOffersAdded( userId : String , completion:@escaping
        (Result<MostAdded,AFError>)->Void){
        performRequest(route: APIRouter.getMostOffersAdded( userID: userId), completion: completion)
    }
    
    static func getUserFavoriteOffers( userId : String , completion:@escaping
        (Result<MyWishList,AFError>)->Void){
        performRequest(route: APIRouter.getUserFavoriteOffers( userID: userId), completion: completion)
    }
    
    static func getOffers( userId : String , completion:@escaping
        (Result<Offers,AFError>)->Void){
        performRequest(route: APIRouter.getOffers( userId: userId), completion: completion)
    }
    
    static func getAllProductCategories( completion:@escaping
        (Result<CategoryOfMall,AFError>)->Void){
        performRequest(route: APIRouter.getAllProductCategories, completion: completion)
    }
    
    static func getAllSellersByCategory( categoryID : String , completion:@escaping
        (Result<StoreSeller,AFError>)->Void){
        performRequest(route: APIRouter.ViewSellersByCategoryId(categoryID: categoryID), completion: completion)
    }
    
    static func getAllProductInStoreByCategory( categoryID : Int , completion:@escaping
        (Result<ProductStoreOfCategory,AFError>)->Void){
        performRequest(route: APIRouter.viewProductCategoryProducts(categoryID: categoryID), completion: completion)
    }
    static func getAllProductInStore( sellerId : String , completion:@escaping
          (Result<AllProduct,AFError>)->Void){
          performRequest(route: APIRouter.viewUserProducts(sellerId: sellerId), completion: completion)
      }
    
    static func getAllProductInStoreFailure( sellerId : String , completion:@escaping
        (Result<Failure,AFError>)->Void){
        performRequest(route: APIRouter.viewUserProducts(sellerId: sellerId), completion: completion)
    }
    
    static func getProductDetails( productID : String , completion:@escaping
        (Result<ProductDetails,AFError>)->Void){
        performRequest(route: APIRouter.viewProductDetails(productID: productID), completion: completion)
    }
    static func getProductDetailsFailure( productID : String , completion:@escaping
           (Result<Failure,AFError>)->Void){
           performRequest(route: APIRouter.viewProductDetails(productID: productID), completion: completion)
       }
    
    static func getSellerDetails( productID : String , completion:@escaping
          (Result<SellerDetails,AFError>)->Void){
        performRequest(route: APIRouter.viewSellerDetails(productId: productID), completion: completion)
      }
    
    static func searchForCategory( searchText : String , completion:@escaping
          (Result<SearchCategories,AFError>)->Void){
        performRequest(route: APIRouter.searchForCategory(search: searchText), completion: completion)
      }
    
    static func searchForCategoryFailure( searchText : String , completion:@escaping
        (Result<Failure,AFError>)->Void){
      performRequest(route: APIRouter.searchForCategory(search: searchText), completion: completion)
    }
    
    static func searchForSeller( searchText : String , completion:@escaping
             (Result<SearchSellers,AFError>)->Void){
           performRequest(route: APIRouter.searchForSeller(search: searchText), completion: completion)
         }
       
       static func searchForSellerFailure( searchText : String , completion:@escaping
           (Result<Failure,AFError>)->Void){
         performRequest(route: APIRouter.searchForSeller(search: searchText), completion: completion)
       }
       
    static func searchForProduct( searchText : String , completion:@escaping
             (Result<SearchProduct,AFError>)->Void){
           performRequest(route: APIRouter.searchForProduct(search: searchText), completion: completion)
         }
       
       static func searchForProductFailure( searchText : String , completion:@escaping
           (Result<Failure,AFError>)->Void){
         performRequest(route: APIRouter.searchForProduct(search: searchText), completion: completion)
       }
    
    
       
    
    
    
}


