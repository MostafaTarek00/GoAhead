// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let searchCategories = try? newJSONDecoder().decode(SearchCategories.self, from: jsonData)

import Foundation

// MARK: - SearchCategories
struct SearchCategories: Codable {
    let categories: [ResultCategory]
    let status: Int
}

// MARK: - Category
struct ResultCategory: Codable {
    let id, name: String
    let image: String
}
