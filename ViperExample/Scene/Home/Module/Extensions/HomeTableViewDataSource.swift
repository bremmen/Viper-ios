//
//  HomeTableViewDataSource.swift
//  ViperExample
//
//  Created by Bruno Fontes on 6/2/22.
//

import UIKit

enum HomeCell {
    case search
    case game(game: Game)
    case genre(genres: [Genre])
}

class HomeTableViewDataSource: NSObject, UITableViewDataSource {

    let controller: HomeViewController

    init(controller: HomeViewController){
        self.controller = controller
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.controller.cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let typeCell = self.controller.cells[indexPath.row]
        switch typeCell {
        case .search:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.nibName,
                                                           for: indexPath)
                    as? SearchTableViewCell else { return SearchTableViewCell() }
            cell.selectionStyle = .none
            return cell
        case .game(let game):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.nibName,
                                                           for: indexPath)
                    as? HomeTableViewCell else { return HomeTableViewCell() }
            cell.set(game: game)
            cell.selectionStyle = .none
            return cell
        case .genre(genres: let genres):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: GenreTableViewCell.nibName,
                                                           for: indexPath)
                    as? GenreTableViewCell else { return GenreTableViewCell() }
            cell.set(genres: genres)
            cell.selectionStyle = .none
            return cell
        }
    }
}
