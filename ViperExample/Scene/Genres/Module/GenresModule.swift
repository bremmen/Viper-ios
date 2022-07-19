//
//  GenreModule.swift
//  ViperExample
//
//  Created by Bruno Fontes on 28/2/22.
//

import Foundation

final class GenresModule {
    static func buildModule() -> GenresViewController {
        let controller: GenresViewController = GenresViewController(nibName: GenresViewController.nibName, bundle: .main)
        let interactor: GenresInteractor = GenresInteractor()
        let router: GenresRouter = GenresRouter()
        let presenter: GenresPresenter = GenresPresenter(interactor: interactor, router: router)
        presenter.viewController = controller
        router.viewController = controller
        interactor.presenter = presenter
        controller.presenter = presenter
        return controller
    }
}
