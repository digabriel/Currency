//
//  AppDelegate.swift
//  Currency
//
//  Created by Dimas Gabriel on 07/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc = CurrencyListViewController()
        let nav = UINavigationController(rootViewController: vc)
        
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }
}

