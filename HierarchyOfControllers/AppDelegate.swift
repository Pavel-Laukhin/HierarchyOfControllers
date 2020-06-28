//
//  AppDelegate.swift
//  HierarchyOfControllers
//
//  Created by Павел on 28.06.2020.
//  Copyright © 2020 Pavel Laukhin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let tabBarController = UITabBarController()
        let viewController1 = ViewController1()
        let viewController2 = ViewController2()
        
        tabBarController.viewControllers = [viewController1, viewController2]
        tabBarController.tabBar.items?[0].image = UIImage(named: "icon")
        tabBarController.tabBar.items?[1].image = UIImage(named: "icon")
        
        viewController1.title = "ViewController1"
        viewController2.title = "ViewController2"

        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = tabBarController
        
        return true
    }

}

