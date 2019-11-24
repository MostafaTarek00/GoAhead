// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let productDteails = try? newJSONDecoder().decode(ProductDteails.self, from: jsonData)

import Foundation

// MARK: - ProductDteails
struct ProductDteails: Codable {
    let status: Int
    let product: Product
    let productImages: [String]
}

// MARK: - Product
struct Product: Codable {
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
