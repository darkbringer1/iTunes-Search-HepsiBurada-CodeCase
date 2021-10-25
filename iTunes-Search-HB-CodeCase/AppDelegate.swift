//
//  AppDelegate.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 24.10.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow()
        let mainView = SearchViewController()
        
        window?.rootViewController = mainView
        window?.makeKeyAndVisible()
        
        return true
    }

}

