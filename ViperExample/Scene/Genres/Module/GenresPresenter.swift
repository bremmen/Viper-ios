//
//  GenrePresenter.swift
//  ViperExample
//
//  Created by Bruno Fontes on 28/2/22.
//

import Foundation

protocol GenresPresenterProtocol: AnyObject {
    func getGenres()
}

protocol GenresInteractorPresenterProtocol: AnyObject {
    func sendGenres(_ genres: [Genre])
}

final class GenresPresenter {

    var interactor: GenresInteractorInputProtocol
    var router: GenresRouter
    weak var viewController: GenresPresenterViewControllerProtocol?

    init(interactor: GenresInteractor, router: GenresRouter) {
        self.interactor = interactor
        self.router = router
    }
}

extension GenresPresenter: GenresInteractorPresenterProtocol{
    func sendGenres(_ genres: [Genre]) {
        viewController?.getGenres(genres)
    }
}
extension GenresPresenter: GenresPresenterProtocol {
    func getGenres() {
        interactor.getGenres { error in print("Error: \(String(describing: error?.localizedDescription))") }
    }
}
