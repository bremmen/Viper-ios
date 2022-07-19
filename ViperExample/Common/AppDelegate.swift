//
//  AppDelegate.swift
//  ViperExample
//
//  Created by Bruno Fontes on 1/2/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupInitialController()
        return true
    }

    func setupInitialController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = CustomTabbar()
        window?.makeKeyAndVisible()
    }
}

