//
//  GenresEntity.swift
//  ViperExample
//
//  Created by Bruno Fontes on 6/3/22.
//

import Foundation

struct GenresEntity: Decodable {
    let results: [Genre]
}

struct Genre: Decodable {
    let id: Int
    let name: String
    let gamesCount: Int
    let image: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case gamesCount = "games_count"
        case image = "image_background"
    }
}
