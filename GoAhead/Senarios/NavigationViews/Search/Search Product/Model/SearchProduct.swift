// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let searchProduct = try? newJSONDecoder().decode(SearchProduct.self, from: jsonData)

import Foundation

// MARK: - SearchProduct
struct SearchProduct: Codable {
    let products: [ResultProduct]
    let status: Int
}

// MARK: - Product
struct ResultProduct: Codable {
    let id, title, price: String
    let image: String
}
