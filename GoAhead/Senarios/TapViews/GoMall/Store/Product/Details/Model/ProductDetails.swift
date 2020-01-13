// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let productDetails = try? newJSONDecoder().decode(ProductDetails.self, from: jsonData)

import Foundation

// MARK: - ProductDetails
struct ProductDetails: Codable {
    let status: Int
    let product: Details
    let productImages: [String]
}

// MARK: - Product
struct Details: Codable {
    let id, idSeller, price, name: String
    let productDescription: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case id
        case idSeller = "id_seller"
        case price, name
        case productDescription = "description"
        case image
    }
}
