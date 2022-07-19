//
//  HomeEntity.swift
//  ViperExample
//
//  Created by Bruno Fontes on 1/2/22.
//

import Foundation

struct HomeEntity: Decodable {
    let results: [Game]
}

struct Game: Decodable {
    let id: Int
    let name: String
    let released: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case released
        case image = "background_image"
    }
}
