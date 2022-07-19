//
//  File.swift
//  ViperExample
//
//  Created by Bruno Fontes on 20/2/22.
//

import UIKit

class CustomTabbar: UITabBarController {

    override func viewDidLoad() {
        UITabBar.appearance().tintColor = .appPink
        setControllers()
    }

    private func setControllers() {
        viewControllers = [
            createNewViewController(controller: HomeModule.buildModule(), title: "HOME", image: UIImage(systemName: "house")!),
            createNewViewController(controller: SearchModule.buildModule(), title: "SEARCH", image: UIImage(systemName: "magnifyingglass")!),
            createNewViewController(controller: GenresModule.buildModule(), title: "GENRE", image: UIImage(systemName: "gamecontroller")!)
        ]
    }

    func createNewViewController(controller: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController  = UINavigationController(rootViewController: controller)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.isHidden = true
        return navController
    }
}
