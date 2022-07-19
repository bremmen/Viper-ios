//
//  GameDetailModule.swift
//  ViperExample
//
//  Created by Bruno Fontes on 6/2/22.
//

import Foundation

import UIKit

final class GameDetailModule {

    static func buildModule(idGame: Int) -> GameDetailViewController {
        let controller = GameDetailViewController(idGame: idGame)
        let interactor: GameDetailInteractor = GameDetailInteractor()
        let router: GameDetailRouter = GameDetailRouter()
        let presenter: GameDetailPresenter = GameDetailPresenter(interactor: interactor, router: router)
        presenter.viewController = controller
        router.viewController = controller
        interactor.presenter = presenter
        controller.presenter = presenter
        return controller
    }
}
