// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let myWishList = try? newJSONDecoder().decode(MyWishList.self, from: jsonData)

import Foundation

// MARK: - MyWishList
struct MyWishList: Codable {
    let status: Int
    let offers: [FavoriteOffers]
}

// MARK: - Offer
struct FavoriteOffers: Codable {
    let id, name: String
    let image: String
    let link: String
    let favorite: Int
}
