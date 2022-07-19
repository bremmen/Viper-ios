//
//  GenresViewController.swift
//  ViperExample
//
//  Created by Bruno Fontes on 21/2/22.
//

import UIKit

protocol GenresPresenterViewControllerProtocol: AnyObject {
    func getGenres(_ genres: [Genre])
}

class GenresViewController: BaseController {
    //    MARK: - outlets
    
    //    MARK: - properties
    var presenter: GenresPresenterProtocol?
    //    MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getGenres()
    }

}

extension GenresViewController: GenresPresenterViewControllerProtocol {
    func getGenres(_ genres: [Genre]) {
        print(genres)
    }
}
