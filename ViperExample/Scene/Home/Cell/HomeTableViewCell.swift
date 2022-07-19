//
//  HomeTableViewCell.swift
//  ViperExample
//
//  Created by Bruno Fontes on 2/2/22.
//

import UIKit
import SDWebImage

class HomeTableViewCell: UITableViewCell, NibLoadableView {

    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.font = .systemFont(ofSize: 20, weight: .black)
            nameLabel.textColor = .white
        }
    }
    @IBOutlet weak var backgroundImage: UIImageView!

    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 30
            containerView.layer.masksToBounds = true
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    func set(game: Game) {
        nameLabel.text = game.name
        configureImage(urlString: game.image)

    }

    private func configureImage(urlString: String) {
        backgroundImage.sd_setImage(with: URL(string: urlString))
    }

}
