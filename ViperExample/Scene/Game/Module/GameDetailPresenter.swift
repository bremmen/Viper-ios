//
//  GameDetailPresenter.swift
//  ViperExample
//
//  Created by Bruno Fontes on 6/2/22.
//

import Foundation


protocol GameDetailPresenterProtocol: AnyObject {
    func getGame(idGame: Int)
}

protocol GameDetailInteractorPresenterProtocol: AnyObject {
    func sendGame(game: GameEntity)
}

final class GameDetailPresenter {

    var interactor: GameDetailInteractorInputProtocol
    var router: GameDetailRouter
    weak var viewController: GameDetailPresenterViewControllerProtocol?

    init(interactor: GameDetailInteractor, router: GameDetailRouter) {
        self.interactor = interactor
        self.router = router
    }
}
extension GameDetailPresenter: GameDetailPresenterProtocol {
    func getGame(idGame: Int) {
        self.interactor.getGame(idGame: idGame)  { error in
            // print("Error: \(error)")
        }
    }
}

extension GameDetailPresenter: GameDetailInteractorPresenterProtocol {
    func sendGame(game: GameEntity) {
        self.viewController?.getGame(game: game)
    }
}
