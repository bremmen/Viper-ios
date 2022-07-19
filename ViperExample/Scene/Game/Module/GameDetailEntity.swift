//
//  GameDetailEntity.swift
//  ViperExample
//
//  Created by Bruno Fontes on 6/2/22.
//

import Foundation

struct GameEntity: Decodable {
    let id: Int
    let name: String
    let released: String
    let description: String
    let website: String
    let image: String
    let image2: String
    let rating: Double

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case released
        case description
        case website
        case image = "background_image"
        case image2 = "background_image_additional"
        case rating
    }
}
