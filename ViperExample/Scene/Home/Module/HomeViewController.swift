//
//  ViewController.swift
//  ViperExample
//
//  Created by Bruno Fontes on 1/2/22.
//

import UIKit
import NVActivityIndicatorView

protocol HomePresenterViewControllerProtocol: AnyObject {
    func getGames(_ games: [Game])
    func setupView(_ games: [Game])
    func getGenres(_ genres: [Genre])
}

class HomeViewController: BaseController {

//    MARK: - Outlet
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = "VIPER GAME"
            titleLabel.minimumScaleFactor = 0.5
            titleLabel.adjustsFontSizeToFitWidth = true
            titleLabel.font = .systemFont(ofSize: 54, weight: .black)
            titleLabel.textColor = .cyan
            titleLabel.backgroundColor = .clear
            titleLabel.isHidden = true
        }
    }
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.isHidden = true
            tableView.separatorStyle = .none
            tableView.dataSource = tableViewDataSource
            tableView.delegate = tableViewDelegate
            tableView.register(UINib(nibName: HomeTableViewCell.nibName, bundle: nil),
                               forCellReuseIdentifier: HomeTableViewCell.nibName)
            tableView.register(UINib(nibName: SearchTableViewCell.nibName, bundle: nil),
                               forCellReuseIdentifier: SearchTableViewCell.nibName)
            tableView.register(UINib(nibName: GenreTableViewCell.nibName, bundle: nil),
                               forCellReuseIdentifier: GenreTableViewCell.nibName)
        }
    }
    @IBOutlet weak var indicator: NVActivityIndicatorView! {
        didSet {
            indicator.type = .pacman
            indicator.color = RandomColor.getColor()
        }
    }
    //    MARK: - properties
    var presenter: HomePresenterProtocol?
    var tableViewDataSource: HomeTableViewDataSource?
    var tableViewDelegate: HomeTableViewDelegate?
    var cells: [HomeCell] = []

    //  MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        presenter?.getGames(startView: true)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }

    private func startView() {
        indicator.stopAnimating()
        presenter?.getGenres()
        titleLabel.isHidden = false
        tableView.isHidden = false
        tableView.reloadData()
    }


}
extension HomeViewController: HomePresenterViewControllerProtocol {
    func getGenres(_ genres: [Genre]) {
        cells.insert(.genre(genres: genres), at: 5)
        tableView.reloadData()
    }
    
    func getGames(_ games: [Game]) {
        for game in games {
            cells.append(.game(game: game))
        }
        tableView.reloadData()
        tableView.tableFooterView = nil
    }

    func setupView(_ games: [Game]) {
        cells.append(.search)
        for game in games {
            cells.append(.game(game: game))
        }
        startView()
    }
}

