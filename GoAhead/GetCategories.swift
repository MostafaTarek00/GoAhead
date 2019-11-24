// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getCategories = try? newJSONDecoder().decode(GetCategories.self, from: jsonData)

import Foundation

// MARK: - GetCategories
struct GetCategories: Codable {
    let status: Int
    let categories: [Category]
}

// MARK: - Category
struct Category: Codable {
    let id, name: String
    let image: String
    let icon: String
}
