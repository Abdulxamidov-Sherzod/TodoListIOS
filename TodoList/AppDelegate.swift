//
//  AppDelegate.swift
//  TodoList
//
//  Created by Sherzod on 06/04/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if UserDefaults.standard.string(forKey: "Name") == nil {
            window = UIWindow()
            let vc = WalkTough(nibName: "WalkTough", bundle: nil)
            window?.rootViewController = vc
            window?.makeKeyAndVisible()
        } else {
            
            window = UIWindow()
            let vc = TabbarItem(nibName: "TabbarItem", bundle: nil)
            window?.rootViewController = vc
            window?.makeKeyAndVisible()
        }
        
        
        return true
    }


}

