//
//  SearchInteractor.swift
//  ViperExample
//
//  Created by Bruno Fontes on 28/2/22.
//

import Foundation

protocol SearchInteractorInputProtocol {
    
}

final class SearchInteractor {
    weak var presenter: SearchInteractorPresenterProtocol?
}

extension SearchInteractor: SearchInteractorInputProtocol {
    
}
