//
//  Service.swift
//  ViperExample
//
//  Created by Bruno Fontes on 1/2/22.
//

import Foundation

class Service {
    static let baseUrl = "https://api.rawg.io/api/"
    static let key = "d28037f1e621465db0fb0239537bb528"

    enum Endpoints {
        static let games = baseUrl + "games"
        static let game = baseUrl + "games/%i"
        static let genres = baseUrl + "genres"
    }
}
