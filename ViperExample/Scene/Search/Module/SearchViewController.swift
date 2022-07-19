//
//  SearchViewController.swift
//  ViperExample
//
//  Created by Bruno Fontes on 21/2/22.
//

import UIKit

protocol SearchPresenterViewControllerProtocol: AnyObject {
    
}

class SearchViewController: BaseController {
    //    MARK: - outlets


    //    MARK: - properties
    var presenter: SearchPresenter?

    //    MARK: - life cycles

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension SearchViewController: SearchPresenterViewControllerProtocol {
    
}
