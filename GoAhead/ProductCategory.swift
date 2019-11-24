// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let productCategory = try? newJSONDecoder().decode(ProductCategory.self, from: jsonData)

import Foundation

// MARK: - ProductCategory
struct ProductCategories: Codable {
    let status: Int
    let categories: [ProductCategory]
}

// MARK: - Category
struct ProductCategory: Codable {
    let id, name: String
    let image: String
}
