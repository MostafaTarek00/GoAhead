// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let categoryOfMall = try? newJSONDecoder().decode(CategoryOfMall.self, from: jsonData)

import Foundation

// MARK: - CategoryOfMall
struct CategoryOfMall: Codable {
    let status: Int
    let categories: [CategoryMall]
}

// MARK: - Category
struct CategoryMall: Codable {
    let id, name: String
    let image: String
}

