//
//  GameDetailInteractor.swift
//  ViperExample
//
//  Created by Bruno Fontes on 6/2/22.
//

import Foundation

protocol GameDetailInteractorInputProtocol {
    func getGame(idGame: Int, failure: @escaping (_ error: Error?) -> ())
}

final class GameDetailInteractor {

    weak var presenter: GameDetailInteractorPresenterProtocol?
}

extension GameDetailInteractor: GameDetailInteractorInputProtocol {
    func getGame(idGame: Int, failure: @escaping (_ error: Error?) -> ()) {
        NetworkingProvider.shared.getGame(idGame: idGame) { game in 
            self.presenter?.sendGame(game: game)
        } failure: { error in
            failure(error)
        }
    }
}

