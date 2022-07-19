//
//  NetworkingProvider.swift
//  ViperExample
//
//  Created by Bruno Fontes on 2/2/22.
//

import Foundation
import Alamofire

class NetworkingProvider {
    static let shared = NetworkingProvider()

    func getGames(page: Int, success: @escaping (_ games: [Game]) -> (), failure: @escaping (_ error: Error?) -> ()) {
        var parameters: Parameters = parametersWithKey()
        parameters["page"] = page

        guard let url = URL(string: Service.Endpoints.games) else { return }
        AF.request(url, method: .get, parameters: parameters).responseDecodable (of: HomeEntity.self) {
            (response) in
            switch response.result {
            case .success(_):
                guard let games = response.value?.results else { return }
                success(games)
            case .failure(let error):
                print("Error Service: \(error)")
                failure(response.error)
            }
        }
    }

    func getGame(idGame: Int, success: @escaping (_ game: GameEntity) -> (), failure: @escaping (_ error: Error?) -> ()) {
        let urlString = String(format: Service.Endpoints.game, idGame)
        guard let url = url(endpoint: urlString) else { return }
        AF.request(url, method: .get).responseDecodable (of: GameEntity.self) {
            (response) in
            switch response.result {
            case .success(_):
                guard let game = response.value else { return }
                success(game)
            case .failure(let error):
                print("Error Service: \(error)")
                failure(response.error)
            }
        }
    }

    func getGenres(success: @escaping (_ genres: [Genre]) -> (), failure: @escaping (_ error: Error?) -> ()) {
        guard let url = url(endpoint: Service.Endpoints.genres) else { return }
        AF.request(url, method: .get).responseDecodable (of: GenresEntity.self) {
            (response) in
            switch response.result {
            case .success(_):
                guard let genres = response.value?.results else { return }
                success(genres)
            case .failure(let error):
                print("Error Service: \(error)")
                failure(response.error)
            }
        }
    }


}
//  MARK: - Private function
extension NetworkingProvider {
    func url(endpoint: String) -> URL? {
        return URL(string:"\(endpoint)?key=\(Service.key)")
    }

    func parametersWithKey() -> Parameters {
        let parameters: Parameters = [
            "key": Service.key
        ]
        return parameters
    }
}

