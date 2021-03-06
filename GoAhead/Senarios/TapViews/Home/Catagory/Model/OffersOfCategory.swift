// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let offersOfCategory = try? newJSONDecoder().decode(OffersOfCategory.self, from: jsonData)

import Foundation

// MARK: - OffersOfCategory
struct OffersOfCategory: Codable {
    let status: Int
    let offers: [OffersOfOneCategory]
}

// MARK: - Offer
struct OffersOfOneCategory: Codable {
    let id, name: String
    let image: String
    let icon: String
    let link: String
    let favorite: Int
}
