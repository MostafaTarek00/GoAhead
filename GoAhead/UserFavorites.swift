// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userFavorites = try? newJSONDecoder().decode(UserFavorites.self, from: jsonData)

import Foundation

// MARK: - UserFavorites
struct UserFavorites: Codable {
    let status: Int
    let offers: [Offer]
}

// MARK: - Offer
struct Offer: Codable {
    let id, name: String
    let image: String
    let link: String
    let favorite: Int
}
