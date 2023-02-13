//
//  ResponseModel.swift
//  FelizWishList
//
//  Created by Edson Yudi Toma on 12/02/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let response = try? JSONDecoder().decode(Response.self, from: jsonData)

import Foundation

// MARK: - Game
struct Game: Codable {
    let name: String // nome
    let capsule: String // thumb
    let reviewDesc: String // OVERALL REVIEWS
    let releaseString: String // data
    let added: Int // time since epoch
    
    enum CodingKeys: String, CodingKey {
        case name, capsule
        case reviewDesc = "review_desc"
        case releaseString = "release_string"
        case added
    }
}

typealias Response = [String: Game]
