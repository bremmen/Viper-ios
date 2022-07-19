//
//  SearchModule.swift
//  ViperExample
//
//  Created by Bruno Fontes on 28/2/22.
//

import Foundation

final class SearchModule {
    static func buildModule() -> SearchViewController {
        let controller = SearchViewController(nibName: SearchViewController.nibName, bundle: .main)
        let interactor: SearchInteractor = SearchInteractor()
        let router: SearchRouter = SearchRouter()
        let presenter: SearchPresenter = SearchPresenter(interactor: interactor, router: router)
        presenter.viewController = controller
        router.viewController = controller
        interactor.presenter = presenter
        controller.presenter = presenter
        return controller
    }
}
