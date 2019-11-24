// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userDetails = try? newJSONDecoder().decode(UserDetails.self, from: jsonData)

import Foundation

// MARK: - UserDetails
struct UserDetails: Codable {
    let status: Int
    let userProfileData: UserProfileData

    enum CodingKeys: String, CodingKey {
        case status
        case userProfileData = "UserProfileData"
    }
}

// MARK: - UserProfileData
struct UserProfileData: Codable {
    let name, mobile, email: String
    let image: String
}
