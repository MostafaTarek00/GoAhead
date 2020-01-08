// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mostAdded = try? newJSONDecoder().decode(MostAdded.self, from: jsonData)

import Foundation

// MARK: - MostAdded
struct MostAdded: Codable {
    let status: Int
    let offers: [MostOffer]
}

// MARK: - Offer
struct MostOffer: Codable {
    let id, name: String?
    let image: String
    let link: String?
    let favorite: Int
}
