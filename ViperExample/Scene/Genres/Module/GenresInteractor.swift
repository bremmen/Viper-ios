//
//  GenreInteractor.swift
//  ViperExample
//
//  Created by Bruno Fontes on 28/2/22.
//

import Foundation

protocol GenresInteractorInputProtocol {
    func getGenres(failure: @escaping (_ error: Error?) -> ())
}

final class GenresInteractor {
    weak var presenter: GenresInteractorPresenterProtocol?
}
extension GenresInteractor: GenresInteractorInputProtocol {
    func getGenres(failure: @escaping (Error?) -> ()) {
        NetworkingProvider.shared.getGenres { genres in
            self.presenter?.sendGenres(genres)
        } failure: { error in
            failure(error)
        }

    }
}
