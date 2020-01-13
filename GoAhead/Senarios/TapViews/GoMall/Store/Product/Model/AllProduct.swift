// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let allProduct = try? newJSONDecoder().decode(AllProduct.self, from: jsonData)

import Foundation

// MARK: - AllProduct
struct AllProduct: Codable {
    let status: Int
    let products: [Product]?
}

// MARK: - Product
struct Product: Codable {
    let id, price, name, productDescription: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case id, price, name
        case productDescription = "description"
        case image
    }
}
