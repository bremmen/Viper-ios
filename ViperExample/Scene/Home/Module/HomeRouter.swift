//
//  Router.swift
//  ViperExample
//
//  Created by Bruno Fontes on 1/2/22.
//

import Foundation

protocol HomeRouterProtocol {
    func openGameDetail(idGame: Int)
}

final class HomeRouter: HomeRouterProtocol {

    weak var viewController: HomeViewController?

    func openGameDetail(idGame: Int) {
        let gameController = GameDetailModule.buildModule(idGame: idGame)
        gameController.modalPresentationStyle = .fullScreen
        viewController?.navigationController?.show(gameController, sender: nil)
    }
    
}
