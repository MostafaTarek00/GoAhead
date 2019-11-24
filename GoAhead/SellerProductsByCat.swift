// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let sellerProducts = try? newJSONDecoder().decode(SellerProducts.self, from: jsonData)

import Foundation

// MARK: - SellerProducts
struct SellerProductsByCat: Codable {
    let status: Int
    let offers: [Product]
}

//// MARK: - Offer
//struct Offer: Codable {
//    let id, name, price, offerDescription: String
//    let image: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, name, price
//        case offerDescription = "description"
//        case image
//    }
//}
