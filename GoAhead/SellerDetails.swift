// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let sellerDetails = try? newJSONDecoder().decode(SellerDetails.self, from: jsonData)

import Foundation

// MARK: - SellerDetails
struct SellerDetails: Codable {
    let status: Int
    let id, name, mail, phone: String
    let photo: String
    let products: [SellerProduct]
}

// MARK: - Product
struct SellerProduct: Codable {
    let id, price, name, productDescription: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case id, price, name
        case productDescription = "description"
        case image
    }
}
