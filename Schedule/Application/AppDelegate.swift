//
//  AppDelegate.swift
//  Schedule
//
//  Created by Grigory Don on 07.12.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow()
        window.rootViewController = MainTabBarController()
        window.makeKeyAndVisible()
        
        self.window = window
        
        return true
    }
}

