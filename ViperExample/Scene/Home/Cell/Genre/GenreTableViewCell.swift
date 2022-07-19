//
//  GenreTableViewCell.swift
//  ViperExample
//
//  Created by Bruno Fontes on 18/4/22.
//

import UIKit

class GenreTableViewCell: UITableViewCell, NibLoadableView {

    @IBOutlet weak var title: UILabel! {
        didSet {
            title.font = .systemFont(ofSize: 32, weight: .black)
            title.textColor = .appGold
            title.text = "Genres"
        }
    }
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet {
            collectionView.dataSource = collectionViewDataSource
            collectionView.delegate = collectionViewDelegate

            collectionView.register(UINib(nibName: HomeGenreCollectionViewCell.nibName, bundle: nil),
                                    forCellWithReuseIdentifier: HomeGenreCollectionViewCell.nibName)
            collectionView.delegate = collectionViewDelegate
            collectionView.dataSource = collectionViewDataSource
        }
    }

    var collectionViewDataSource: HomeCollectionViewDataSource = .init()
    var collectionViewDelegate: HomeCollectionViewDelegate = .init()

    func set(genres: [Genre]) {
        collectionViewDataSource.genreData = genres
        collectionView.reloadData()
    }


}
