// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let sellersCategories = try? newJSONDecoder().decode(SellersCategories.self, from: jsonData)

import Foundation

// MARK: - SellersCategories
struct SellersCategories: Codable {
    let status: Int
    let sellers: [Seller]
}

// MARK: - Seller
struct Seller: Codable {
    let idCategory: Int
    let id, name: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case idCategory = "id_category"
        case id, name, image
    }
}
