//
//  HomeTableViewDelegate.swift
//  ViperExample
//
//  Created by Bruno Fontes on 6/2/22.
//

import UIKit
import NVActivityIndicatorView

class HomeTableViewDelegate: NSObject, UITableViewDelegate {

    let controller: HomeViewController

    init(controller: HomeViewController) {
        self.controller = controller
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellType = controller.cells[indexPath.row]
        switch cellType {
        case .search:
            print("Search")
        case .game(let game):
            self.controller.presenter?.openGameDetail(idGame: game.id)
        case .genre(_):
            break
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentSize.height - scrollView.contentOffset.y - scrollView.frame.height < 10 {
            controller.tableView.tableFooterView = addFooterView()
            controller.presenter?.getGames(startView: false)
        }
    }

}
extension HomeTableViewDelegate {
    private func addFooterView() -> UIView {
        let footerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: controller.view.frame.size.width, height: 100))
        let spinner = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40), type: .pacman, color: RandomColor.getColor(), padding: 0)
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        return footerView
    }
}
