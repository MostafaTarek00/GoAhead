// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let productStoreOfCategory = try? newJSONDecoder().decode(ProductStoreOfCategory.self, from: jsonData)

import Foundation

// MARK: - ProductStoreOfCategory
struct ProductStoreOfCategory: Codable {
    let status: Int
    let offers: [ProductStore]
}

// MARK: - Offer
struct ProductStore: Codable {
    let id, name, price, offerDescription: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case id, name, price
        case offerDescription = "description"
        case image
    }
}
