//
//  Interactor.swift
//  ViperExample
//
//  Created by Bruno Fontes on 1/2/22.
//

import Foundation

protocol HomeInteractorInputProtocol {
    func getGames(startView: Bool, page: Int, failure: @escaping (_ error: Error?) -> ())
    func getGenres(failure: @escaping (_ error: Error?) -> ())
}

final class HomeInteractor {
    weak var presenter: HomeInteractorPresenterProtocol?
}

extension HomeInteractor: HomeInteractorInputProtocol {
    func getGames(startView: Bool, page: Int, failure: @escaping (_ error: Error?) -> ()) {
        NetworkingProvider.shared.getGames(page: page) { games in
            if startView {
                self.presenter?.setupView(games)
            } else {
                self.presenter?.sendGames(games)
            }
        } failure: { error in
            failure(error)
        }
    }

    func getGenres(failure: @escaping (Error?) -> ()) {
        NetworkingProvider.shared.getGenres { genres in
            self.presenter?.sendGenres(genres)
        } failure: { error in
            failure(error)
        }

    }
}
