// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let offers = try? newJSONDecoder().decode(Offers.self, from: jsonData)

import Foundation

// MARK: - Offers
struct Offers: Codable {
    let status: Int
    let offers: [AllOffers]
}

// MARK: - Offer
struct AllOffers: Codable {
    let id, name: String
    let image: String
    let link: String
    let favorite: Int
}
