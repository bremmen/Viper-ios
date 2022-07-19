//
//  GameDetailViewController.swift
//  ViperExample
//
//  Created by Bruno Fontes on 6/2/22.
//

import UIKit
import NVActivityIndicatorView

protocol GameDetailPresenterViewControllerProtocol: AnyObject {
    func getGame(game: GameEntity)
}

class GameDetailViewController: BaseController {

//    MARK: - Output
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = .systemFont(ofSize: 26, weight: .black)
            titleLabel.textColor = .appPink
            titleLabel.isHidden = true
        }
    }
    @IBOutlet weak var releasedLabel: UILabel! {
        didSet {
            releasedLabel.textColor = .white
            releasedLabel.isHidden = true
        }
    }
    @IBOutlet weak var gameImage: UIImageView! {
        didSet {
            gameImage.layer.cornerRadius = 30
            gameImage.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var ratingLabel: UILabel! {
        didSet {
            ratingLabel.textColor = .appCyan
            ratingLabel.font = .systemFont(ofSize: 16, weight: .bold)
            ratingLabel.isHidden = true
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.textColor = .white
            descriptionLabel.font = .systemFont(ofSize: 14, weight: .medium)
            descriptionLabel.isHidden = true
        }
    }

    @IBOutlet weak var indicator: NVActivityIndicatorView! {
        didSet {
            indicator.type = .pacman
            indicator.color = RandomColor.getColor()
        }
    }

    //    MARK: - Properties
    var presenter: GameDetailPresenterProtocol?
    var idGame: Int
//    MARK: - Life Cycle
    init(idGame: Int){
        self.idGame = idGame
        super.init(nibName: GameDetailViewController.nibName, bundle: .main)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        presenter?.getGame(idGame: idGame)
    }

    private func configureImage(image: UIImageView, urlString: String) {
        guard let url = URL(string: urlString) else { return }
        if let data = try? Data(contentsOf: url) {
            image.image = UIImage(data: data)
        }
    }

    private func showLabels() {
        titleLabel.isHidden = false
        releasedLabel.isHidden = false
        descriptionLabel.isHidden = false
        ratingLabel.isHidden = false
        indicator.stopAnimating()
    }
}

extension GameDetailViewController: GameDetailPresenterViewControllerProtocol {
    func getGame(game: GameEntity) {
        titleLabel.text = game.name
        releasedLabel.text = game.released
        descriptionLabel.text = game.description.removeHtmlTag()
        ratingLabel.text = "Rating: " +  String(game.rating) + "/5"
        configureImage(image: gameImage, urlString: game.image)
        showLabels()
    }
}
