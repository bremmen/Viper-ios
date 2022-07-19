//
//  HomeCollectionViewDataSource.swift
//  ViperExample
//
//  Created by Bruno Fontes on 18/4/22.
//

import UIKit

class HomeCollectionViewDataSource: NSObject, UICollectionViewDataSource {

    var genreData: [Genre] = []

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.genreData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeGenreCollectionViewCell.nibName,
                                                       for: indexPath)
                as? HomeGenreCollectionViewCell else { return HomeGenreCollectionViewCell() }
        cell.set(genre: genreData[indexPath.row])
        return cell
    }
}
