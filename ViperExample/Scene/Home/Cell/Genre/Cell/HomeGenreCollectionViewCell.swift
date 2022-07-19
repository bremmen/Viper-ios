//
//  HomeGenreCollectionViewCell.swift
//  ViperExample
//
//  Created by Bruno Fontes on 19/4/22.
//

import UIKit

class HomeGenreCollectionViewCell: UICollectionViewCell, NibLoadableView {

    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = .appGold
            titleLabel.font = .systemFont(ofSize: 22, weight: .bold)
        }
    }
    @IBOutlet weak var image: UIImageView!{
        didSet {
            image.layer.cornerRadius = 15
            image.layer.masksToBounds = true
        }
    }

    func set(genre: Genre) {
        titleLabel.text = genre.name
        image.sd_setImage(with: URL(string: genre.image))
    }

}
