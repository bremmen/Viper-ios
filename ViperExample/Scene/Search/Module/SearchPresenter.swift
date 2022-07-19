//
//  SearchPresenter.swift
//  ViperExample
//
//  Created by Bruno Fontes on 28/2/22.
//

import Foundation

protocol SearchPresenterProtocol: AnyObject {

}

protocol SearchInteractorPresenterProtocol: AnyObject {
    
}

final class SearchPresenter {

    var interactor: SearchInteractorInputProtocol
    var router: SearchRouter
    weak var viewController: SearchPresenterViewControllerProtocol?

    init(interactor: SearchInteractor, router: SearchRouter) {
        self.interactor = interactor
        self.router = router
    }
}

extension SearchPresenter: SearchInteractorPresenterProtocol {
    
}
