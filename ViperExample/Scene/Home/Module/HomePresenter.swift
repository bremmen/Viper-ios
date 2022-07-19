//
//  Presenter.swift
//  ViperExample
//
//  Created by Bruno Fontes on 1/2/22.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    func getGames(startView: Bool)
    func openGameDetail(idGame: Int)
    func getGenres()
}

protocol HomeInteractorPresenterProtocol: AnyObject {
    func setupView(_ games: [Game])
    func sendGames(_ games: [Game])
    func sendGenres(_ genres: [Genre])
}

final class HomePresenter {

    var interactor: HomeInteractorInputProtocol
    var router: HomeRouter
    var page = 1
    weak var viewController: HomePresenterViewControllerProtocol?

    init(interactor: HomeInteractor, router: HomeRouter) {
        self.interactor = interactor
        self.router = router
    }
}
extension HomePresenter: HomePresenterProtocol {
    func getGenres() {
        interactor.getGenres { error in
            print(error)
        }
    }

    func getGames(startView: Bool) {
        interactor.getGames(startView: startView, page: self.page) { error in print("Error: \(String(describing: error?.localizedDescription))") }
        page += 1
    }

    func openGameDetail(idGame: Int) {
        self.router.openGameDetail(idGame: idGame)
    }
}

extension HomePresenter: HomeInteractorPresenterProtocol {
    func sendGenres(_ genres: [Genre]) {
        viewController?.getGenres(genres)
    }

    func sendGames(_ games: [Game]) {
        viewController?.getGames(games)
    }

    func setupView(_ games: [Game]) {
        viewController?.setupView(games)
    }
}
