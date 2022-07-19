//
//  HomeModule.swift
//  ViperExample
//
//  Created by Bruno Fontes on 1/2/22.
//

import UIKit

final class HomeModule {

    static func buildModule() -> HomeViewController {
        let controller = HomeViewController(nibName: HomeViewController.nibName, bundle: .main)
        let interactor: HomeInteractor = HomeInteractor()
        let router: HomeRouter = HomeRouter()
        let presenter: HomePresenter = HomePresenter(interactor: interactor, router: router)
        let tableViewDataSource: HomeTableViewDataSource = HomeTableViewDataSource(controller: controller)
        let tableViewDelegate: HomeTableViewDelegate = HomeTableViewDelegate(controller: controller)
        presenter.viewController = controller
        router.viewController = controller
        interactor.presenter = presenter
        controller.presenter = presenter
        controller.tableViewDataSource = tableViewDataSource
        controller.tableViewDelegate = tableViewDelegate
        return controller
    }
}
