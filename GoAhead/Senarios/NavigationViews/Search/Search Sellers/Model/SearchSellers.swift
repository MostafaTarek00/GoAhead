// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let searchSellers = try? newJSONDecoder().decode(SearchSellers.self, from: jsonData)

import Foundation

// MARK: - SearchSellers
struct SearchSellers: Codable {
    let sellers: [ResultSeller]
    let status: Int
}

// MARK: - Seller
struct ResultSeller: Codable {
    let id, name: String
    let image: String
    let idCategory: String

    enum CodingKeys: String, CodingKey {
        case id, name, image
        case idCategory = "id_category"
    }
}
